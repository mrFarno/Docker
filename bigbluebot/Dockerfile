# Use an official Ubuntu Xenial as a parent image
FROM ubuntu:16.04

# Install Node.js 8 and npm 5
RUN apt-get update
RUN apt-get -qq update
RUN apt-get install -y build-essential
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_lts.x | bash
RUN apt-get install -y nodejs
RUN apt-get install -y gconf-service \
                        libxext6 \
                        libxfixes3 \ 
                        libxi6 \
                        libxrandr2 \
                        libxrender1 \
                        libcairo2 \
                        libcups2 \
                        libdbus-1-3 \
                        libexpat1 \
                        libfontconfig1 \
                        libgcc1 \
                        libgconf-2-4 \
                        libgdk-pixbuf2.0-0 \
                        libglib2.0-0 \
                        libgtk-3-0 \
                        libnspr4 \
                        libpango-1.0-0 \
                        libpangocairo-1.0-0 \
                        libstdc++6 \
                        libx11-6 \
                        libx11-xcb1 \
                        libxcb1 \
                        libxcomposite1 \
                        libxcursor1 \
                        libxdamage1 \
                        libxss1 \
                        libxtst6 \
                        libappindicator1 \
                        libnss3 \
                        libasound2 \
                        libatk1.0-0 \
                        libc6 \
                        ca-certificates \
                        fonts-liberation \
                        lsb-release \
                        xdg-utils \
                        wget   
# Set the working directory to /app
WORKDIR /var/www

# Install any needed packages specified in requirements.txt
RUN npm i bigbluebot

# Copy the current directory contents into the container
COPY ./config/.env /var/www/node_modules/bigbluebot
COPY ./config/run.js /var/www/node_modules/bigbluebot
COPY ./config/config.json /var/www/node_modules/bigbluebot/config
COPY ./config/pool.js /var/www/node_modules/bigbluebot/lib

# Make port 8080 available outside this container
EXPOSE 8080

WORKDIR /var/www/node_modules/bigbluebot

# Run `npm start` when the container launches
# CMD ["node", "/var/www/node_modules/bigbluebot/run.js"]