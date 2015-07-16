# E-lycee


## Installation du Projet

### Requirements
- [Node.js](https://nodejs.org/)
- MySQL
- Gulp installé globalement `npm install -g gulp`

### Installation des Vendors
```
composer install
npm install
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


## Dependencies

### CSS
- [Material Design Light](http://getmdl.io)

### JS
- [jQuery](https://jquery.com/)
- [Better-dateinput-polyfill](https://github.com/chemerisuk/better-dateinput-polyfill)


## Crédits

Amélie Meunier / @yuplaboom
Gabriel Cousin / @gabrielcousin
