# Simple Health Check

## Create project

```shell
composer create-project --prefer-dist laravel/lumen healthcheck
cd healthcheck
```

## Edit routes/web.php

```php
<?php

$router->get('/', function () use ($router) {
    return ;
});


$router->get('/healthcheck', function () use ($router) {
    $arr = array("health" => true, "timestamp" => time(), "version" => $router->app->version() );
    $out = json_encode($arr);

    return $out;
});

```

## Create Dockerfile

```docker
FROM php:7-alpine

WORKDIR /var/www

COPY . /var/www

RUN apk add composer && cd /var/www && composer update

CMD  php -S 0.0.0.0:8080 -t /var/www/public
```
