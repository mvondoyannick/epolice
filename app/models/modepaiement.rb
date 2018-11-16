class Modepaiement < ApplicationRecord

  validates :name, presence: {message: 'Merci de remplir le mode de paiement'}, uniqueness: true


end
