class Infraction < ApplicationRecord
	has_one :Contravention
	belongs_to :convocation
end
