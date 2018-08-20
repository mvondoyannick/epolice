class Fylo < ApplicationRecord
    belongs_to :role
    validates_presence_of :name, presence: true, uniqueness: true
    validates_presence_of :prenom, presence: true
    validates_presence_of :phone, presence: true, uniqueness: true
    validates_presence_of :email, presence: true, uniqueness: true

    #verifie si l'utilisateur est admin
    def is_admin?
        self.role_id == 1
    end

    #verifier si c'est un partenaire
    def is_partner?
        self.role_id != 1
    end

    #verifier si c'est une administration
    def is_etat?
        self.role_id == 2
    end
end
