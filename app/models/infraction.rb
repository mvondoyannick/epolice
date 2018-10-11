class Infraction < ApplicationRecord
	#has_one :contravention
	before_commit :set_source
	has_many :convocation
	belongs_to :zonecouverturemotif
  belongs_to :region
	belongs_to :departement
	belongs_to :arrondissement
	validates :motif, presence: true, uniqueness: {message: '#{value} exite deja dans le systeme.'}
  validates :montant, presence: {message: 'Le montant est obligatoire'}
  #validates :source, presence: {message: 'Merci de fournir la source juridique'}

	def set_source
		if self.source.nil?
			self.source = "Aucune source juridique"
		end
	end

end
