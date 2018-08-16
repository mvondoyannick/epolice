class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #devise init
  #before_action :configure_devise_parameters, if: :devise_controller?
  #before_action :is_admin?

def configure_devise_parameters
  devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :prenom, :note)}
end

private

def current_user
  return unless session[:id]
  @current_user ||= Fylo.find(session[:id]).role.name
end

def is_admin?
  #redirect_to root_path unless 
  if Fylo.find(session[:id]).role.name == "admin"
    render controller: "access", action: "login"
  end
end

def is_other?
  if Fylo.find(session[:id]).role.name != "admin"
    print "me voici donc"
  end
end

end
