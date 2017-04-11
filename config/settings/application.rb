SimpleConfig.for :application do
  group :api do
    group :coingate do
      set :url, 'https://api-sandbox.coingate.com'
      set :app_id, ENV["COINGATE_APP_ID"]
      set :api_key, ENV["COINGATE_API_KEY"]
      set :api_secret, ENV["COINGATE_API_SECRET"]
    end
  end
end
