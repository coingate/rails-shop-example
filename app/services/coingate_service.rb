class CoingateService
  CRYPTO_CURRENCIES = %(BTC ETH)
  
  def initialize

  end

  def currency_rate(from, to)
    response = RestClient.get("#{Settings.api.coingate.url}/v2/rates/merchant/#{from}/#{to}", credentials)

    response.to_str.to_f
  end

  def create_order(order_params = {})
    begin
      response = RestClient.post("#{Settings.api.coingate.url}/v2/orders", order_params, credentials.merge('Content-Type' => 'application/x-www-form-urlencoded'))

      response(response.code, response.to_str)
    rescue => e
      response(e.http_code, e.response)
    end
  end

  def get_order(id)
    response = RestClient.get("#{Settings.api.coingate.url}/v2/orders/#{id}", credentials)

    begin
      OpenStruct.new(success?: true, http_code: response.code, response: JSON.parse(response.to_str, symbolize_names: true))
    rescue => e
      
    end
  end

  def response(http_code, response_body)
    response_body = JSON.parse(response_body, symbolize_names: true) rescue response_body

    OpenStruct.new(success?: http_code == 200, http_code: http_code, reason: response_body.try(:fetch, :reason, nil), response: response_body)
  end

  def credentials
    { Authorization: "Token #{Settings.api.coingate.auth_token}" }
  end
end