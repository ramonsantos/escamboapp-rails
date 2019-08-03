# Escambo App

[![Maintainability](https://api.codeclimate.com/v1/badges/a538c473e01bcb45b5e5/maintainability)](https://codeclimate.com/github/ramonsantos/escamboapp-rails/maintainability)

## Setup

### Run Docker containers

``` bash
docker-compose up -d
```

### Install dependencies
``` bash
bundle install
```

#### On Ubuntu
``` bash
sudo apt-get install imagemagick libmagickwand-dev
```

#### On Fedora
``` bash
sudo dnf install ImageMagick
```

### Create and migrate database
``` bash
rake db:create db:migrate
```

### Run application
``` bash
foreman start
```
