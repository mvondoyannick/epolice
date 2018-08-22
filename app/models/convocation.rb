class Convocation < ApplicationRecord
    has_secure_token :token
    belongs_to :agent
    belongs_to :infraction
    validates_presence_of :cni, presence: true, message: "Ajouter un Numéro de CNI"
    validates_presence_of :phone, presence: true, message: "Ajouter un numéro de téléphone"
end
