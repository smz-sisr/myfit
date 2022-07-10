class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller? #ログイン機能について
  before_action :configure_account_update_parameters, if: :devise_controller? #編集機能について
  
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :weight, :height, :comment])
  end

  def configure_account_update_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :weight, :height, :comment])
  end
end
