class ApplicationController < ActionController::Base
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user!

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :passowrd ])
    # devise_parameter_sanitizer.permit(:account_update, keys: [:name, :introduction, :profile_image])
    # devise_parameter_sanitizer.permit(:sign_in, keys:[:name, :passowrd])
  end
  # def user_params
  #   params.require(:user).permit(:name, :email, :password,)
  # end 
  private
  def after_sign_in_path_for(resource)
        user_path(resource)
  end
end
