const bigbluebot = require('bigbluebot')

let actions = async page => {
    await bigbluebot.audio.modal.listen(page)
    page.setDefaultNavigationTimeout(0)
}

bigbluebot.run(actions)