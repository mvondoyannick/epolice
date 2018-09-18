class Convocation < ApplicationRecord
    require 'httparty'
    require 'active_record'
    require 'active_record/associations'
    require 'active_record/associations/association'
    #before_commit :send_sms
    after_commit :send_sms
    #before_commit :set_status
    #after_save :send_sms
    #on autorise le transfert via https avec HTTParty
    #HTTParty::Basement.default_options.update(verify: false)

    has_secure_token :token

    belongs_to :agent
    belongs_to :infraction
    belongs_to :pieceretenu
    validates_presence_of :cni, presence: true, message: "Ajouter un Numéro de CNI"
    validates_presence_of :phone, presence: true, message: "Ajouter un numéro de téléphone"

    has_one_attached :fichier

    public
    def set_status
        self.status = "Impayé"
    end

    def send_sms
        message = "Le numero #{self.phone} enregistre à la Piece d identite #{self.cni} a ete VERBALISE pour des motifs de la voie publique: Plus d'information a l adresse http://pop-circulation.herokuapp.com/public/verbal/#{self.code}.upcase . Presenter ce code pour paiement #{self.code}.upcase "
        HTTParty.get("https://www.agis-as.com/epolice/index.php?telephone=#{self.phone}&message=#{message}")
    end

end
