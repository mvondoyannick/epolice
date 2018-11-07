class Region < ApplicationRecord
  has_many :infraction
  has_many :commissariat
  has_many :departement
  has_many :agent

  validates :name, presence: {message: "Le nom de la région ne peut etre vide"}, uniqueness: {message: "%{value} existe deja."}
end
