class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  protected

  def configure_permitted_parameters
      p "registrations_controllerを通っています"
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name ,:height, :weight, :comment])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :height, :weight, :comment])
  end
end

