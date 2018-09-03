class Convocation < ApplicationRecord
    require 'httparty'
    before_commit :set_infraction
    after_save :send_sms
    #on autorise le transfert via https avec HTTParty
    HTTParty::Basement.default_options.update(verify: false)

    has_secure_token :token

    belongs_to :agent
    belongs_to :infraction
    belongs_to :pieceretenu
    validates_presence_of :cni, presence: true, message: "Ajouter un Numéro de CNI"
    validates_presence_of :phone, presence: true, message: "Ajouter un numéro de téléphone"

    private

    def set_infraction
        #self.infraction = 6
    end

    def send_sms
        # Basic usage
        message = "La CNI #{self.cni} est verbalisee pour #{self.infraction.motif}, cout: #{self.infraction.montant}. plus d infos cliquer sur le lien https://pop-circulation.herokuapp.com/epolice/convocation/public/c/#{self.token}"
        sms = HTTParty.get("https://www.agis-as.com/epolice/index.php?telephone=#{self.phone}&message=#{message}")
        puts "======= #{sms.code} ======="
    end

end
