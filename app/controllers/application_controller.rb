class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_default_settings
  before_action :set_cart

  private

  def set_default_settings
    session[:currency_rate]     ||= 1
    session[:currency]          ||= 'USD'
    session[:receive_currency]  ||= 'EUR'
  end

  def set_cart
    @cart = CartSession.new(session)
  end

  def coingate_client
    CoingateService.new
  end

  def current_currency
    session[:currency]
  end
  helper_method :current_currency

  def current_currency_rate
    session[:currency_rate]
  end
  helper_method :current_currency_rate

  def current_receive_currency
    session[:receive_currency]
  end
  helper_method :current_receive_currency

  def currencies
    @currencies ||= {
      usd: { title: 'United States dollar' },
      eur: { title: 'Euro' },
      btc: { title: 'Bitcoin' }
    }
  end
  helper_method :currencies

end
