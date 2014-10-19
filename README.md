# README

## Depencies

  - Ruby 2.1.2 (other versions not tested)
  - Bundler
  - Elastic search (requires JDK & JSDK < 1.8)

## Setup

Copy yml configuration files from examples:

```
  $ cp config/database.yml.example config/database.yml
  $ cp config/secrets.yml.example config/secrets.yml
```

Install gems

```
  $ bundle install
```

Create databases and tables

```
  $ rake db:create db:migrate
```

Index data

```
  $ bundle exec rake environment elasticsearch:import:model CLASS='Recipe'
```
