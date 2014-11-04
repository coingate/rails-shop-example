class AccountSettingsController < ApplicationController
  def index
    
  end

  def update
    session[:receive_currency] = params[:receive_currency]

    redirect_to account_settings_path
  end
end