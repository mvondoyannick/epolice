class Infraction < ApplicationRecord
	#has_one :contravention
	has_many :convocation
end
