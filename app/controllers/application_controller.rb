class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?
   before_action :configure_account_update_parameters, if: :devise_controller?
   before_action :sanitize_gender_params, if: :devise_controller?
   
   private
   def configure_permitted_parameters
       devise_parameter_sanitizer.permit(:sign_up, keys: [:icon_image, :name, :gender, :age, :weight, :height, :comment])
   end 
   
   def configure_account_update_parameters
       devise_parameter_sanitizer.permit(:account_update, keys: [:icon_image, :name, :gender, :age, :weight, :height, :comment]) 
   end
   
 
  def sanitize_gender_params
    if params["user"].present? && params["user"]["gender"].present?
       params["user"]["gender"] = params["user"]["gender"].to_i
    end
  end
  
end
