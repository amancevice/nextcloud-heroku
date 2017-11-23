# Nextcloud on Heroku

Deploy your own [Nextcloud](https://nextcloud.com) instance on [Heroku](https://heroku.com).

## Docker Compose

Use `docker-compose` to deploy Nextcloud locally:

```bash
docker-compose up -d
# Wait for MySQL/Nextcloud to start...
open http://localhost:8000
```

## Heroku

Follow the instructions on Heroku's [Container Registry & Runtime](https://devcenter.heroku.com/articles/container-registry-and-runtime) for creating a new heroku app.

### MySQL Add-on

Add a MySQL add-on to your app. This will contain your Nextcloud backend.

JawsDB:

```bash
heroku addons:create jawsdb:kitefin
```

ClearDB:

```bash
heroku addons:create cleardb:ignite
```

Once the add-on is ready, take note of the connection details.

### Configuration

You will need to set config variables to allow Nextcloud to connect to the MySQL backend as well as the Nextcloud administrator login info.

Set the following config variables in your app:

```bash
heroku config:set MYSQL_DATABASE=<db>
heroku config:set MYSQL_HOST=<host>
heroku config:set MYSQL_PASSWORD=<password>
heroku config:set MYSQL_USER=<user>
heroku config:set NEXTCLOUD_ADMIN_PASSWORD=<password>
heroku config:set NEXTCLOUD_ADMIN_USER=<user>
```

### Deploy

Login to the Heroku container registry:

```bash
heroku container:login
```

Build & push the image to your app:

```bash
heroku container:push web
```
