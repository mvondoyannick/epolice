class Convocation < ApplicationRecord
    require 'httparty'
    require 'active_record'
    require 'active_record/associations'
    require 'active_record/associations/association'
    #before_commit :send_sms
    #after_create :send_sms
    before_create :set_code

    after_save :set_transfert
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

    public
    def set_status
        # 0 = impayé
        # 1 = payé
        self.status = '0'
    end

    def set_code
        self.code = SecureRandom.hex(3).upcase
        self.token = SecureRandom.hex(10).upcase
    end

    def self.send_email
      UserMailer.with(user: @user).welcome_email.deliver_later
    end

    def send_sms

        message = "Mr/Mme #{self.phone}, le cout de l'amende est de #{self.infraction.montant} FCFA. Code contraveniton : #{self.code}. Rendez-vous sur https://goo.gl/3hm3ke."
        result = HTTParty.get("https://www.agis-as.com/epolice/index.php?telephone=#{self.phone}&message=#{message}")
        puts "========== #{result}"
    end

    #permet d'effectuer l'achivage, le premier archivage pour cette contravention
    # developer: mailto:mvondoyannick@gmail.com
    # detail: on fait l'archivage si tout de passe bien au niveau contravention
    def set_transfert
        commit = Transfert.new(agent_id: self.agent_id, convocation_id: self.id, status: true)
        if commit.save
            puts 'success'
            send_sms
        else
            puts commit.errors.messages
        end
    end

    private

    def transfet_params
       #params.permit(:agent_id, :convocation)
    end

end
