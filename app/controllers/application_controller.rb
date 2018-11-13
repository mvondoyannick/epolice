class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :add_log

  #helper_method :current_user
  #helper_method :is_control?
  #helper_method :control? #permet de verifier si un utilisateur est administrateur

  def after_sign_in_path_for(resource)
    if metropoli_signed_in?
      #on fait une action
    elsif admin_signed_in?
      #on fait une action
    elsif grvpc_signed_in?
      #on fait encore une action
    elsif assurance_signed_in?
      access_admin_path
    end
  end

  private

  def add_log
    #permet de journaliser toutes les action dans la plateforme
    log = Log.new
    log.browser = request.env['HTTP_USER_AGENT']
    log.address = request.remote_ip#request.env['REMOTE_ADDR']
    log.controller = params[:controller]
    log.action = params[:action]
    log.date = Time.now
    #log.user = current_member.email
    #log.role = current_member.service.name

    #on enregistre l'activité
    log.save

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
