module ApplicationHelper
    def jiggle
        'je peux le faire'
    end

    #verifier si l'utilisateur est un administrateur
    def control?
        sessid = session[:id]
        Fylo.find(sessid).role_id == 1
      end
end
