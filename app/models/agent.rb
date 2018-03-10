class Agent < ApplicationRecord
	has_many :convocation
	belongs_to :commissariat
	has_many :alertes
  has_many :affectations
end
