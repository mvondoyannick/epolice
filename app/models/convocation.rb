class Convocation < ApplicationRecord
    require 'httparty'
    require 'active_record'
    require 'active_record/associations'
    require 'active_record/associations/association'
    #before_commit :send_sms
    after_create :send_sms
    before_create :set_code
    #before_commit :set_status
    #after_save :send_sms
    #on autorise le transfert via https avec HTTParty
    HTTParty::Basement.default_options.update(verify: false)

    has_secure_token :token

    #travail avec sunspot
    searchable do
      text :cni, :phone, :immatriculation, :code
    end

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

    def set_code
        self.code = SecureRandom.hex(3).upcase
        self.token = SecureRandom.hex(10).upcase
    end

    def self.send_email
      UserMailer.with(user: @user).welcome_email.deliver_later
    end

    def send_sms
        message = "Bien vouloir payer votre amende pour rentrer en possession de la piece retenue. Code contraveniton : #{self.code}"
        HTTParty.get("https://www.agis-as.com/epolice/index.php?telephone=#{self.phone}&message=#{message}")
    end

end
