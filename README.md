# Laravel API, MySQL and Nuxt in Docker

## Installation

```bash
git clone https://github.com/ionesculiviucristian/laravel-api-mysql-nuxt-docker
```

## Laravel and Nuxt setup

### Laravel

```bash
composer create-project laravel/laravel api
```

### Nuxt

You can customize the answers config with your own requirements:

```json
{
    "name": "app", 
    "language": "ts", 
    "pm": "npm", 
    "ui": "vuetify", 
    "features": "axios",
    "linter": "eslint",
    "test": "none",
    "mode": "universal",
    "target": "server",
    "devTools": "jsconfig.json",
    "ci": "none",
    "vcs": "none"
}
```

```bash
npm init nuxt-app app --answers='{"name":"app","language":"ts","pm":"npm","ui":"vuetify","features":"axios","linter":"eslint","test":"none","mode":"universal","target":"server","devTools":"jsconfig.json","ci":"none","vcs":"none"}'
cd app
npm run build
```

### Register virtual hosts

```bash
sudo nano /etc/hosts
127.0.0.1 api.app.com
127.0.0.1 app.com
```

### Generate certificates

```bash
cd scripts
sudo ./generate_ca_certificates.sh
```

### Running Docker

```bash
cd ..

docker stop $(docker ps -a -q)

dc up -d
```

## Extra

### XDebug

https://www.jetbrains.com/help/phpstorm/2020.3/browser-debugging-extensions.html
