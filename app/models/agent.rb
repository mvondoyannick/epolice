class Agent < ApplicationRecord

	before_save :generate_hash

	has_many :convocation
	belongs_to :commissariat
	has_many :alertes
	has_many :affectations
	belongs_to :grade
	#belongs_to :agentphone

	#pour les villes d'affectations
	belongs_to :ville


	#ajout d'activeStorage pour une seule image
	has_one_attached :avatar

	private

	def generate_hash
		self.crypted = SecureRandom.hex(10) if self.crypted.nil?
	end

end
