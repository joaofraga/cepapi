# CEP Finder

This README document all steps are necessary to get this application up and running.

## Requirements

- Ruby 2.6.3
- PostgreSQL 12.4
- Rails 6.0.3.3

## How to setup

Clone this repository at your machine:

```
$ git clone git@github.com:joaofraga/cepapi.git
$ cd cepapi
```

Install gems

```
$ bundle install
```

Create database & run migrations (if needed modify file `config.database.yml` with your database settings)

```
$ rake db:create && rake db:migrate
```

Create an User

```
$ rails c
$ User.create(email: 'user@myemail.com', password: 'mypassword')
```

## Running the application

The most important and easiest step, just run the following command at application folder

```
$ rails s
```

Now access at your browser: http://localhost:3000.

## Using the API

Base URL:
```
http://localhost:3000`
```

### Authenticate

Authenticates a user by email and password and returns a Token

* **Path**: `/authenticate`
* **Method**: `POST`
* **Params**:
  - email: The users email (required)
  - password: The users password (required)
* **Response**
  - token: expected token to authenticate on the API


### Find a CEP

Returns all the information needed for the given CEP

* **Path**: `/authenticate`
* **Method**: `POST`
* **Headers**:
  - Authenticate: `Bearer #{Token}`
* **Params**:
  - zip_code: the CEP you want to retrieve information (required)
* **Response**
  - address: the address of given CEP
  - district: the district of given CEP
  - code: the code of given CEP
  - city: the city of given CEP
  - state: the state of given CEP
  - full_address: the full address of given CEP