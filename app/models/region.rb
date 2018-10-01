class Region < ApplicationRecord
  has_many :infraction
  has_many :commissariat

  validates :name, presence: {message: "La valeur de la région ne peut etre vide"}, uniqueness: {message: "Erreur, La valeure %{value} est déja present."}
end
