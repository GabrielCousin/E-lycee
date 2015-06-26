# E-lycee


## Installation du Projet

### Requirements
- Node.js
- MySQL
- Gulp installé globalement `npm install -g gulp`
- Bower `npm install-g bower`

### Installation des Vendors
```
composer install
npm install
bower install
```


## Lancement

### Développement
1. Installer Browsersync globalement `npm install -g browser-sync`
2. Mettre à jour `parameters.yml`
3. Lancer la tâche Gulp : `gulp dev`
4. Lancer le serveur : `php app/console server:run`

### Production
1. Générer le CSS : `gulp`
2. Lancer le serveur : `php app/console server:run`

### Base de données
1. Créer une base de données `e-lycee`
2. Importer `elycee.sql` : `mysql -u root -p e-lycee < elycee.sql`


## Crédits

Amélie Meunier / @yuplaboom
Gabriel Cousin / @gabrielcousin
