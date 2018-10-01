class Arrondissement < ApplicationRecord
  belongs_to :region
  belongs_to :departement
  belongs_to :ville
  has_many :commissariat
  validates :name, presence: {message: "La valeur ne peut etre vide"}, uniqueness: {message: "%{value} existe deja"}
end
