# Installation

1. Clone this repo `git clone git@github.com:coingate/rails-shop-example.git`
2. Run `bundle install`
3. Create `rails_shop_example_development` database and check [database config file](https://github.com/coingate/rails-shop-example/blob/master/config/database.yml#L6)
4. Run `rake db:seed`
5. Create Sandbox Account. https://sandbox.coingate.com/sign_up
6. Create Api Access Key. https://sandbox.coingate.com/account/apps
7. Create .env file and add API credentials, see `config/settings/application.rb`
8. Run `rails server`

# Important links

* API Documentation: https://developer.coingate.com/
* CoinGate Support: http://support.coingate.com/