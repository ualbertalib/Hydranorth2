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
