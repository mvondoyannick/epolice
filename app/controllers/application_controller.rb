class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #before_action :verifyLogin #permet de verifier qi l'utilisateur est connecté avant toute chose

  #devise init
  #before_action :configure_devise_parameters, if: :devise_controller?
  #before_action :is_admin?
  before_action :add_log

  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :prenom, :note)}
  end

  helper_method :current_user
  helper_method :is_control?
  helper_method :control? #permet de verifier si un utilisateur est administrateur

  def control?
    sessid = session[:id]
    Fylo.find(sessid).role_id == 1
  end

  def current_user
    #return unless session[:id]
    @current_user ||= Fylo.find(session[:id])
  end


  def is_other?
    if Fylo.find(session[:id]).role.name != "admin"
      print "me voici donc"
    end
  end

  private

  def add_log
    #permet de journaliser toutes les action dans la plateforme

  end

  def verifyLogin
    if !session[:role].nil?
      case current_user.role.name #found_user.service
        when "urgence"
          session[:role] = "urgence"
          redirect_to(controller: 'access', action: 'request_service', sessid: current_user.code)
        when "developer"
          session[:role] = "admin"
          redirect_to(controller: 'access', action: 'developer')
        when "admin"
          session[:role] = current_user.role.name
          redirect_to(controller: 'access', action: 'admin')
        when "administrateur"
          session[:role] = current_user.role.name
          redirect_to(controller: 'access', action: 'administrateur')
        when "eneo" || "camwater" || "camtel"
          session[:role] = current_user.role.name
          redirect_to(controller: 'access', action: 'request_service') 
      end
    else
      render layout: 'login'
    end
  end

end
