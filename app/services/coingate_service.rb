class CoingateService
  def initialize

  end

  def currency_rate(from, to)
    response = RestClient.get("https://sandbox.coingate.com/api/v1/currencies/rate/#{from}/#{to}", credentials)

    JSON.parse(response.to_str)['rate'].to_f
  end

  def create_order(order_params = {})
    begin
      response = RestClient.post('https://sandbox.coingate.com/api/v1/orders', order_params, credentials.merge('Content-Type' => 'application/x-www-form-urlencoded'))

      response(response.code, response.to_str)
    rescue => e
      response(e.http_code, e.response)
    end
  end

  def get_order(id)
    response = RestClient.get("https://sandbox.coingate.com/api/v1/orders/#{id}", credentials)

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
    nonce     = (Time.now.to_f * 1e6).to_i
    message   = nonce.to_s + Settings.api.coingate.app_id.to_s + Settings.api.coingate.api_key
    signature = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), Settings.api.coingate.api_secret, message)

    { 'Access-Nonce' => nonce, 'Access-Key' => Settings.api.coingate.api_key, 'Access-Signature' => signature }
  end
end