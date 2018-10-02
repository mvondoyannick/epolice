class Infraction < ApplicationRecord
	#has_one :contravention
	has_many :convocation
	belongs_to :zonecouverturemotif
  belongs_to :region
	belongs_to :departement
	belongs_to :arrondissement
	validates :motif, presence: true, uniqueness: {message: '#{value} exite deja dans le systeme.'}
  validates :montant, presence: {message: 'Le montant est obligatoire'}
  validates :source, presence: {message: 'Merci de fournir la source juridique'}
end
