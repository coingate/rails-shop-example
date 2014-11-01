class CurrenciesController < ApplicationController
  def set_currency
    params[:currency].upcase!

    session[:currency_rate] = coingate_client.currency_rate('USD', params[:currency])
    session[:currency]      = params[:currency]

    redirect_to root_path
  end
end