class Convocation < ApplicationRecord
    require 'httparty'
    #before_commit :send_sms
    #before_commit :set_status
    #after_save :send_sms
    #on autorise le transfert via https avec HTTParty
    HTTParty::Basement.default_options.update(verify: false)

    has_secure_token :token

    belongs_to :agent
    belongs_to :infraction
    belongs_to :pieceretenu
    validates_presence_of :cni, presence: true, message: "Ajouter un Numéro de CNI"
    validates_presence_of :phone, presence: true, message: "Ajouter un numéro de téléphone"

    has_one_attached :fichier

    private
    def set_status
        self.status = "Impayé"
    end

end
