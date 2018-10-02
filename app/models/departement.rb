class Departement < ApplicationRecord
  has_many :commissariat
  has_many :infraction
  belongs_to :region
  validates :name, presence: true, uniqueness: {message: 'Erreur, %{value} existe déja.'}
end
