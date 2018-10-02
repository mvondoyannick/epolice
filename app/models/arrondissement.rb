class Arrondissement < ApplicationRecord
  belongs_to :region
  belongs_to :departement
  has_many :commissariat
  has_many :infraction
  validates :name, presence: {message: "La valeur ne peut etre vide"}, uniqueness: {message: "%{value} existe deja"}
end
