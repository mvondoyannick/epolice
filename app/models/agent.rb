class Agent < ApplicationRecord
	has_many :convocation
	belongs_to :commissariat
end
