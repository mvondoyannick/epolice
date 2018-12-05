# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  #before_action :configure_sign_up_params, only: [:create]
  #skip_before_action :verify_authenticity_token, :only => [:destroy]

  # GET /resource/sign_in
  def new
     super
  end

  # POST /resource/sign_in
  #def create
  #  super
  #end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :remember_me])
    #devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password, :remember_me)}
  end

  def sign_in_params
    devise_parameter_sanitizer.sanitize(:sign_in)
  end

  # The path used after sign up.
  def after_sign_in_path_for(resource)
    super(resource)
    parametre_index_path
  end


  #def configure_sign_up_params
  #  devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :phone, :phone1, :name)}
  #end
end
