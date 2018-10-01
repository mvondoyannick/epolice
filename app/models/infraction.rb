class Infraction < ApplicationRecord
	#has_one :contravention
	has_many :convocation
	belongs_to :zonecouverturemotif
	belongs_to :ville
  belongs_to :region
end
