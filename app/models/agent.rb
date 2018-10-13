class Agent < ApplicationRecord

	before_save :generate_hash

	has_many :convocation
	has_many :alertes
	has_many :affectations
	belongs_to :grade
	belongs_to :unite

	validates_presence_of :name, presence: true
	validates_presence_of :age, presence: true
	validates :matricule, presence: {message: 'Merci de fournir un matricule'}, uniqueness: {message: '%{value} existe deja'}
	validates :sexe, presence: {message: 'merci de selectionner un sexe'}
	validates :phone, presence: {message: 'Merci de fournir le numéro de téléphone'}, uniqueness: {message: '%{value} semble déja etre utilisé'}

	#pour les villes d'affectations
	belongs_to :region


	#ajout d'activeStorage pour une seule image
	has_one_attached :avatar

	private

	def generate_hash
		self.crypted = SecureRandom.hex(10) if self.crypted.nil?
	end

end
