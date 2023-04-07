class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :nickname, :encrypted_password, :surname, :first_name, :surname_kana, :first_name_kana, :birthday])
  end
end
