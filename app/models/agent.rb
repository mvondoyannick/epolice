class Agent < ApplicationRecord

	has_many :convocation
	belongs_to :commissariat
	has_many :alertes
	has_many :affectations
	belongs_to :grade

	#ajout d'activeStorage pour une seule image
	has_one_attached :avatar

end
