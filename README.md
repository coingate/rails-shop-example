# Installation

1. Clone this repo `git clone git@github.com:coingate/rails-shop-example.git`
2. Run `bundle install`
3. Create `rails_shop_example_development` database and check [database config file](https://github.com/coingate/rails-shop-example/blob/master/config/database.yml#L6)
4. Run `rake db:seed`
5. Create Sandbox Account. https://sandbox.coingate.com/sign_up
6. Create Api Access Key. https://sandbox.coingate.com/account/apps
7. Create `settings/local.rb` file.
```
SimpleConfig.for :application do
  group :api do
    group :coingate do
      set :app_id, YOUR_APP_ID
      set :api_key, YOUR_API_ACCESS
      set :api_secret, YOUR_API_SECRET
    end
  end
end
```
8. Run `rails server`
