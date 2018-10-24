class Agent < ApplicationRecord

	before_save :generate_hash
  before_save :set_token

	has_many :convocation
	has_many :alertes
	has_many :affectations
	belongs_to :grade
	belongs_to :unite
	#belongs_to :commissariat


	#pour la photo de l'agent

	has_one_attached :avatar

	validates :name, presence: {message: 'Merci de fournir le nom.'}
	validates :age, presence: {message: 'Merci de selectionner age.'}
	validates :matricule, presence: {message: 'Merci de fournir un matricule'}#, uniqueness: {message: '%{value} existe deja.'}
	validates :sexe, presence: {message: 'merci de selectionner un sexe'}
	validates :phone, presence: {message: 'Merci de fournir le numéro de téléphone'}
	validates :grade, presence: {message: 'Merci de selectionner le grade.'}
	validates :region, presence: {message: 'Merci de selectionner la région.'}
	validates :unite, presence: {message: 'Merci de selectionner le service.'}

	#pour les villes d'affectations
	belongs_to :region


	#ajout d'activeStorage pour une seule image
	has_one_attached :avatar

	#retourn ne nom et le prenom de l'agent
	def complete_name
		self.name+' '+self.prenom
	end

	#on genere le token à l'enregistrement de l'agent
	def set_token
		self.tokenagent = SecureRandom.hex(3)
		self.expire = 3.hour.from_now
	end

	private

	def generate_hash
		self.crypted = SecureRandom.hex(10) if self.crypted.nil?
	end

end
