# System requirements:
* Ruby version 2.6.0
* Rails version ~> 5.0.7

# Installation

Clone the project:

`git clone https://github.com/WlademirRenan/bank_accounting.git`

Run:

`bundle install`

`rails db:create`

`rails db:migrate`

`rails db:seed`

The Account have the following params:
* description;
* balance;

The Transference have the following params:
* source_account_id;
* destination_acoount_id;
* amount;

# Endpoints:

`GET  /api/v1/balance` => Show account balance

`POST /api/v1/transference` => Create a transference

`headers: { Authorization: "Bearer test123" }` => Header for authentication

# Contributing

Fork, then clone the repo:

    git clone https://github.com/WlademirRenan/bank_accounting.git

Set up Ruby dependencies via Bundler

    bundle install

Make sure the tests pass.

Make your change.

Write tests.

Make the tests pass.

Write a good commit message.

Push to your fork.

Submit a pull request pr.

Wait for us.

We try to at least comment on pull requests.

We may suggest changes.

Thank you for your contribution!