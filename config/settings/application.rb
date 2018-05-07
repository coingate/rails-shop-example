SimpleConfig.for :application do
  group :api do
    group :coingate do
      set :url, 'https://api-sandbox.coingate.com'
      set :auth_token, ENV["COINGATE_AUTH_TOKEN"]
    end
  end
end
