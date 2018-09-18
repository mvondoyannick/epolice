class Convocation < ApplicationRecord
    require 'httparty'
    before_commit :send_sms
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
        message = "Vous avez ete VERBALISE via le numero #{self.phone} pour les motif(s) ci-apres : . Le montant de l amende est de :  F CFA. Presenter ce code pour paiement #{self.code} "
        HTTParty.get("https://www.agis-as.com/epolice/index.php?telephone=#{self.phone}&message=#{message}")
    end

end
