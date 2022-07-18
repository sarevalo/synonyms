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

### Views

```
SELECT *
FROM words t1
LEFT OUTER JOIN synonyms t2
ON t1.id = t2.word_id
WHERE t1.reference = 'conocer'


-- In this case we can know how many synonyms each word has

SELECT t1.reference, COUNT(t2.word_id) number
FROM words t1
LEFT OUTER JOIN synonyms t2
ON t1.id = t2.word_id
WHERE t1.reference = 'conocer'
AND t1.status = 1
GROUP BY t1.reference

```

### Graphql query

```
{
  Media(id: 5) {
    id
    title {
      romaji
      english
      native
      userPreferred
    }
    format
    description
    startDate {
      year
      month
      day
    }
    endDate {
      year
      month
      day
    }
  }
}
```