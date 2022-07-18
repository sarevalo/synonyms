# README

This README would normally document whatever steps are necessary to get the
application up and running.

## Project setup

### Install docker and docker-compose

### Clone repository from GitLab

```
git clone
```

### Setup .env variables

#### Copy file .env.example and rename to .env

```shell
cp .env.example .env
```

### Build image

```shell
docker-compose build
```

### Setup database

```shell
docker-compose run --rm challenge bundle exec rake db:setup
```

### Start project for the first time

```shell
docker-compose up -d
```

### Run rubocop

```shell
docker-compose run --rm challenge bundle exec rubocop -a
```

### Run specs

```shell
docker-compose run --rm challenge bundle exec rspec
```



### Repository

```
https://github.com/sarevalo/synonyms
```

### Documentation

```
https://fitune-challenge.herokuapp.com/api-docs/index.html
```

### Collection

```
public/Fitune Challenge.postman_collection.json
```

