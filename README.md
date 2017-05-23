# HydraNorth2

[![Build Status](https://travis-ci.org/ualbertalib/Hydranorth2.svg?branch=master)](https://travis-ci.org/ualbertalib/Hydranorth2)
[![Coverage Status](https://coveralls.io/repos/github/ualbertalib/Hydranorth2/badge.svg?branch=master)](https://coveralls.io/github/ualbertalib/Hydranorth2?branch=master)

## TODO! Add information to me!


## Running the Tests

Setup dependencies and run the test suite:

   ```sh
   $ bundle install
   $ rake db:migrate
   ```

You can run the Fedora and Solr servers in one window with:

   ```sh
   $ rake hydra:test_server
   ```

And run the test suite in another window:

   ```sh
   $ rake spec
   ```

You can then run rubocop with:

  ```sh
  $ rubocop
  ```

  Or may also use the following rake task to do everything at once (rubocop/setup test servers/run rspec):

  ```sh
  $ rake hydranorth:ci
  ```

## Configuring SAML

* Update `secrets.yml`/`omniauth.rb` config files for the SAML implementation (you may need to generate a certificate/key for certain environments)
* Give IST's Identity Provider (uat-login or login) the metadata for our service provider
  * Quick way to view this metadata is to the start the Rails server and navigate to `localhost:3000/auth/saml/metadata` (feel free to edit this metadata accordingly for example adding Organization and ContactPerson metadata)
* Once this is complete, login via SAML should be working successfully

(TODO: Provide an alternative to IST? Like TestShib?)

## Building docker image

   You can build docker image for Hydranorth2 following precedure below.
   There is a copy of ualibraries/hydranorth2 image that can be pulled
   from [dockerhub](https://hub.docker.com/r/ualibraries/hydranorth2/)

   ```shell
   docker build -t ualibraries/hydranorth2 .
   ```



