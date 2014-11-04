class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_currency_rate
  before_action :set_cart

  private

  def set_currency_rate
    session[:currency_rate] = 1     if session[:currency_rate].blank?
    session[:currency]      = 'USD' if session[:currency].blank?
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

  def currencies
    @currencies ||= {
      usd: { title: 'United States dollar', icon: 'us' },
      eur: { title: 'Euro', icon: 'eu' },
      btc: { title: 'Bitcoin', icon: 'btc' }
    }
  end
  helper_method :currencies

end
