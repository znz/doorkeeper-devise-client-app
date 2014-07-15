# Doorkeeper Client Example

## Requirements

- Ruby 2.1.2
- Rails 4.1.4
- https://github.com/znz/doorkeeper-provider-app

## How to use

Clone the client example:

    git clone https://github.com/znz/doorkeeper-devise-client-app
    cd doorkeeper-devise-client-app

Register app to your provider with callback url `http://localhost:3000/users/auth/doorkeeper/callback` (or with any port)
and create .env:

    DOORKEEPER_APP_ID=f22e89c...
    DOORKEEPER_APP_SECRET=0d15cb9...
    DOORKEEPER_APP_URL=http://(your deployed provider).herokuapp.com/
    DOORKEEPER_APP_NAME=doorkeeper-provider-app

And run client:

    bundle install
    ./bin/rake db:migrate
    ./bin/rails server

And open `http://localhost:3000`.
