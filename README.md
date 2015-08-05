# E-lycee


## Installation du Projet

### Requirements
- [Node.js](https://nodejs.org/)
- MySQL
- Gulp installé globalement `npm install -g gulp`
- Composer installé globalement

## Lancement

### Base de données
1. Créer une base de données `e-lycee`
2. Importer `elycee.sql` : `mysql -u root -p e-lycee < elycee.sql`

### Développement
1. Installer Browsersync globalement `npm install -g browser-sync`
2. Installer les modules Node `npm install`
3. Lancer Componser `composer install`
4. Mettre à jour `parameters.yml`
5. Lancer la tâche Gulp (front : `gulp home` ou `gulp dashboard` | back : `gulp`)
6. Lancer le serveur : `php app/console server:run`

### Production
1. `git clone` ou `git checkout __tag___`
2. Vérification de l'environment `php app/check.php`
3. Lancer Componser `composer install --no-dev --optimize-autoloader`
4. Vider le cache `php app/console cache:clear --env=prod --no-debug`
5. Vider les assets `php app/console assetic:dump --env=prod --no-debug`
6. Préparer les vhosts
7. Relancer Apache `sudo apachectl -k graceful` ou Nginx `sudo service nginx restart`

## Vhosts

### Nginx

```
server {
    server_name e-lycee.io;
    root /__path_to_project__/web;

    location / {
        try_files $uri @rewriteapp;
    }

    location @rewriteapp {
        rewrite ^(.*)$ /app.php/$1 last;
    }

    location ~ ^/(app|app_dev|config)\.php(/|$) {
        fastcgi_pass unix:/var/run/php5-fpm.sock;
        fastcgi_split_path_info ^(.+\.php)(/.*)$;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param HTTPS off;
    }

    error_log /var/log/nginx/e-lycee_error.log;
    access_log /var/log/nginx/e-lycee_access.log;
}
```

### Apache

```
<VirtualHost *:80>
    DocumentRoot "__path_to_project__/web"
    ServerName e-lycee.io

    DocumentRoot "__path_to_project__/web"
    <Directory "__path_to_project__/web">
        AllowOverride All
        Require all granted
    </Directory>

    # uncomment the following lines if you install assets as symlinks
    # or run into problems when compiling LESS/Sass/CoffeScript assets
    # <Directory /var/www/project>
    #     Options FollowSymlinks
    # </Directory>

    ErrorLog /var/log/apache2/e-lycee_error.log
    CustomLog /var/log/apache2/e-lycee_access.log combined
</VirtualHost>
```

## Dependencies

### CSS
- [Material Design Light](http://getmdl.io)

### JS
- [Better-dateinput-polyfill](https://github.com/chemerisuk/better-dateinput-polyfill)


## Crédits

Amélie Meunier / @yuplaboom
Gabriel Cousin / @gabrielcousin
