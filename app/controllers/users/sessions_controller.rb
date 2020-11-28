# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :authenticate_user!

  def new
    super
      # @user = User.find(params[:id])
      # redirect_to '/users/:id'
  end

  def show
    super
    # @user = User.find(params[:id])
  end
  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  # def destroy
  #   @user = current_user
  #   super
  #   session[:keep_signed_out] = true
  #   if@user.destroy
  #     flash[:notice] = "Signed out successfully."
  #   else
  #     render :'users/:id'
  #   end
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  private
  def user_params
    params.require(:user).permit(:name, :password)
  end
end
