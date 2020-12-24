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
cd ../docker/dev/build/nginx-proxy/certs

openssl genrsa -des3 -out appCA.key 2048

openssl req -x509 -new -nodes -key appCA.key -sha256 -days 825 -out appCA.pem

openssl genrsa -out app.com.key 2048

openssl req -new -key app.com.key -out app.com.csr

>app.com.ext cat <<-EOF
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names
[alt_names]
DNS.1 = app.com
DNS.2 = api.app.com
EOF

openssl x509 -req -in app.com.csr -CA appCA.pem -CAkey appCA.key -CAcreateserial -out app.com.crt -days 825 -sha256 -extfile app.com.ext
```

### Running Docker

```bash
cd ../../../../../

mkdir -p volumes/mysql

dc up -d
```

## Extra

### XDebug

https://www.jetbrains.com/help/phpstorm/2020.3/browser-debugging-extensions.html