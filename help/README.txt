*** DEPLOIEMENT D'UN SERVEUR LOCAL VIA DOCKER ***

- PREREQUIS
	- Accès administrateurs sur le poste
	- Un compte sur le site officiel de Docker (gratuit)

- INSTALLATION
	- Créez un dossier à la racine d'un disque (C: ou D:) /!\ Pour des soucis de permission il est important de bien se placer à la racine du disque 
	Ce dossier devra contenir :
		- Le dossier du projet que vous souhaitez déployer
		- Le dossier Docker
  	/!\ Docker peut rencontrer des soucis de permissions concernant l'accès à certains disques (cf plus bas)

	- Télécharger l'installer du client Docker pour Windows via ce lien : https://docs.docker.com/docker-for-windows/install/

	- Lancer l'installer et suivez l'installation en laissant tout par défaut.
	/!\ Malgré l'installation Docker Desktop ne sera pas à jour, vous devez faire la màj qu'il vous propose

	- Lancer le client (Docker Desktop) en mode administrateur
		/!\ Docker a besoin de Microsoft Hyper-V pour fonctionner : Lorsqu'une fenêtre vous proposera de l'activer cliquez sur Ok
		L'ordinateur redémarrera de lui-même.
		Si vous avez néanmoins des problèmes à ce niveau (notamment une erreur "vt-x is not available") suivez les instructions suivantes :
		- Ouvrir le PowerShell Windows (/!\ Pas n'importe quel invité de commande) en mode admin et tapez :
			Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
		- Ne pas redémarrer immédiatement. Dans les paramètres Windows :
			-> Alimentation et mise en veille
				-> Paramètres d'alimentation supplémentaires
					-> Choisir l'action des boutons d'alimentation
						-> Décocher la case "Activer le démarrage rapide (recommandé)"
		- Eteindre le poste (ne pas juste redémarrer)
		- Attendre quelques minutes avant de rallumer le poste
		- Lancer le client Docker en admin

- PERMISSIONS POUR LES DISQUES
	Comme indiqué précedemment, vous aurez peut-être besoin d'autoriser Docker à accéder à vos disques. Pour cela :
  		- Clic droit sur l'icone de Docker (la petite Baleine) dans la partie droite de votre barre des taches
  		- Dans le menu déroulant, onglet "Settings"
  		- Dans la fenêtre qui s'ouvre :
  			-> Shared Drives
  				-> Cocher les disques que vous souhaitez autoriser
  	L'application Docker pour Windows étant encore en Beta cette fonctionnalité n'est pas encore parfaitement au point, c'est pourquoi il est conseillé (voire nécessaire) de travailler A LA RACINE DU DISQUE

- VERSION DE PHP
	Choisissez la version de php que vous souhaitez utiliser. Par défaut, la version utilisée est la 7.0.33. Si vous voulez en changer, référez vous au docker-compose.yml
	/!\ La version php du serveur est la 7.0.30. Ne soyez pas surpris de rencontrer des petits soucis de compatibilité (se référer ici : https://www.php.net/ChangeLog-7.php si vous voulez connaître les différences entre ces 2 versions)

- CONFIGURATION DE PHP
	Si vous souhaitez modifier la configuration de PHP de votre serveur Docker, faites ces modifications dans le php.ini présent dans le dossier Docker
	/!\ Ne pas toucher au dossier config !
	De base ce serveur est configuré pour le developpement, les erreurs/warnings PHP s'affichent directement dans le navigateur !
	Pour changer cela, ouvrez le fichier php.ini et supprimez les 2 premières lignes

- PORTS PAR DEFAUT
	Le serveur Ubuntu de Docker est sur le localhost:80
  	PhpMyAdmin est sur le localhost:8080. Les logins sont les suivants :
  		serveur : db (C'est le serveur par défaut auquel se connecte PhpMyAdmin)
  		utilisateur : root
  		mot de passe : root
  	Pour les modifier, ouvrir le docker-compose.yml
  	Si vous souhaitez modifier les ports par défaut, référez vous également au docker-compose.yml

- DEPLOIEMENT
	La configuration actuelle vous donne le choix entre un serveur local Apache ou Nginx. Suivant votre choix, éxecutez une des commandes suivante :
		cd chemin/vers/dossier/Docker && docker-compose -f docker-compose_apache.yml up
		(si le projet est sur un disque différent du c: (par exemple le disque d:) la commande sera 
			d: && cd chemin/vers/dossier/Docker && docker-compose -f docker-compose_apache.yml up
		)
		
		OU

		cd chemin/vers/dossier/Docker && docker-compose -f docker-compose_nginx.yml up
		(si le projet est sur un disque différent du c: (par exemple le disque d:) la commande sera 
			d: && cd chemin/vers/dossier/Docker && docker-compose -f docker-compose_nginx.yml up
		)
	Les deux commandes ne peuvent pas fonctionner en même temps ! Si vous voulez passer de Apache à Nginx ou inversement, vous devez stopper le premier serveur (ctrl C dans cmder) et ensuite lancer l'autre.
	L'installation peut être un peu longue la première fois ! 
	Lors du premier déploiement, l'erreur suivante peut survenir : 
		Error response from daemon: driver failed programming external connectivity on endpoint
	Quitter puis relancer Docker Desktop règle généralement le soucis

- COMPOSER & COMMANDES LINUX
	Si vous voulez éxécuter des commandes Linux sur votre serveur Ubuntu, ouvrez un autre invité de commande (toujours en admin) et procédez comme suit :
	- docker container ls
	- Sous le libelle NAMES récupérer celui dont le nom sera de la forme docker_oniris_dev_X
		(Si vous n'avez qu'un seul serveur docker de déployé, le nom sera toujours docker_oniris_dev_1)
	- Executer la commande : 
		docker exec -ti docker_oniris_dev_X bash
	/!\ Vos commandes ne seront pas persistées si vous redémarrez le serveur Docker ! Si vous créez de nouveaux fichiers/dossiers de cette façon, ils ne seront pas sauvegardés
	- Utilisation de composer :
		- Après avoir suivi les instructions précédentes, placez vous dans votre projet (cd <votre_projet>)
		- Vous pouvez effectuer toutes les commandes proposées par composer

- INSTALLATION DE MOODLE
	/!\ Cette configuration est adaptée au serveur de prod ou Moodle est en v3.5.9
	Pour télécharger cette version, accédez au lien suivant :
	https://github.com/moodle/moodle/archive/v3.5.9.zip
	Vous ne pourrez pas installer les dernières versions de Moodle car elles ont besoin de PHP7.1 minimum pour fonctionner
	Cette configuration est prête à accueillir Moodle. Voici la marche à suivre :
		- Placer le dossier Moodle au bon endroit (cf section INSTALLATION)
		- Lancer le docker-compose up et se rendre sur le port 80 du localhost
		- Cliquer sur le dossier Moodle
		- Suivre l'installation en laissant tout par défaut
		- Lorsque vous arrivez à la configuration de la base de données, les champs devront être remplis comme tel :
			- Serveur: docker_db_1		(Le nom du conteneur hébergeant la base de donnée, vérifier le numero avec un docker container ls)
			- Nom: moodle
			- User: root
			- Mot de passe: root
			- Préfixe des tables: mdl_
			- Port: 3306
			- Socket UNIX: /var/run/mysqld/mysqld.sock
			/!\ Si vous avez défini un autre mot de passe pour le compte root dans le docker-compose.yml (cf section PORTS PAR DEFAUT), vous devez utiliser ce mot de passe
			/!\ Si vous ne souhaitez pas utiliser le compte root vous devez via PhpMyAdmin ou autre (avant de lancer l'installation de Moodle):
				- Créer manuellement la base moodle (la laisser vide)
				- Créer l'utilisateur que vous souhaitez et lui donner tous les droits sur la base de données moodle

- DESINSTALLATION 
	Vous pouvez vider le cache de Docker. Pour cela éxécuter la commande suivante (toujours en admin) :
		docker system prune -a
		(l'invité de commande va vous demander confirmation, lisez bien ses avertissements !)
	Il est conseillé d'éxécuter cette commande lorsque vous n'avez plus besoin du serveur Docker sur votre poste, pour libérer l'espace disque occupé par les images (~ entre 1 et 2 gigas)
	Désinstaller simplement l'application Docker Desktop

- ERREURS POSSIBLES
	- Pour refaire une installation propre de tous les services, videz le cache de docker (docker system prune -a) et relancez le déploiement (docker-compose up)

	- ERROR: for <service>  Cannot link to a non running container: (cette erreur apparaît dans la console lorsque vous tentez de déployer le projet)
		- Executez la commande suivante :
			docker-compose up -d --force-recreate <service> && docker-compose up ("<service>" devra être remplacé par le nom du service rapporté dans l'erreur)
		Si le problème vient du container docker_db_X (ou par un service/container dont le nom se terminerai par db ou db_X) : 
		/!\ Malheuresement cette opération vous fera perdre toutes les tables/données créées par le biais du serveur Docker
			- Dans l'explorateur Windows, dans le dossier contenant votre projet et le dossier Docker :
				-> Supprimer le dossier ddb
				(Windows peut être "tatillon" concernant ce dossier : il ne voudra pas en supprimer certains sous-dossiers.
				Pour ce faire, vous devrez supprimer leur contenu à la main avant de pouvoir les supprimer.)
			- Une fois l'opération effectuée, vous pouvez éxécuter la commande docker-compose up -d --force-recreate db
			- Au cas où cette erreur persiste malgré tout, éxécutez les commandes suivantes :
				- docker-compose rm --all (validez en tapant y+Entrée)
				- docker-compose up

	- Error response from daemon: Cannot link to a non running container (Cette erreur survient lorsque vous tentez d'accéder aux sources de votre projet sur le serveur Linux avec la commande docker exec -ti docker_oniris_dev_X bash)
		- cf erreur précédente

	- Les 2 erreurs précédentes (et d'autres) peuvent survenir si les ports utilisés par Docker (80 et 8080 par défaut) sont déjà occupés (Skype a tendance à l'utiliser. Vérifiez également que vous n'avez pas de serveur WAMP allumé, qui occupe généralement ces ports).
	Vérifiez que vous utilisez des ports libres et modifiez la configuration en conséquence (cf section PORTS PAR DEFAUT)
	Vous pouvez vérifier quels ports sont utilisés en tapant la commande netstat -ab

	- Fatal error: require(): Failed opening required 'vendor/exemple/de/chemin/Exemple.php' (Cette erreur est une erreur PHP : elle apparaît dans votre navigateur lorsque vous naviguez sur votre projet)
	Le fait que ce chemin débute par "vendor" a ici son importance, si ce n'est pas le cas cette solution ne reglera pas ce problème
	Ce problème intervient car le projet utilise des dépendances (librairies créées par d'autre developpeurs), il faudra donc les installer
	(vous noterez la présence d'un ficher nommé composer.json à la racine du projet)
	Pour résoudre ce problème, ouvrez un nouvel invité de commande en admin et éxécutez les commandes suivantes :
		- docker exec -ti docker_oniris_dev_X bash
		(X est un nombre, probablement 1, cf la section COMPOSER & COMMANDES LINUX si la console vous renvoie Error: No such container: docker_oniris_dev_X)
		- cd <votre_projet>
		- (vous pouvez vérifier la présence du fichier composer.json en tapant la commande ls)
		- composer install

	- ERROR: for docker_<service>_X  Cannot start service <service>: b"error while creating mount source path '/un/premier/chemin': mkdir /un/deuxieme/chemin: permission denied" (Lorsque vous essayez de déployer votre projet)
	C'est un souci de permissions, cette erreur est la raison pour laquelle vous devez placer votre projet et le dossier Docker dans un dossier à la racine du disque
	- Error response from daemon: driver failed programming external connectivity on endpoint
	Quitter puis relancer Docker Desktop règle généralement le soucis

- MAINTENANCE
	Si vous rencontrez d'autres problèmes ou avez des questions/suggestions contactez moi à l'adresse suivante :
		felicien.arnault@oniris-nantes.fr