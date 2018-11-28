class Region < ApplicationRecord
  has_many :infraction
  has_many :commissariat
  has_many :departement
  has_many :agent

  before_save :validate_region

  validates :name, presence: {message: "Le nom de la région ne peut etre vide"}, uniqueness: {message: "%{value} existe deja."}

  private
  def validate_region
    if Region.all.count == 10
      #on annuler l'enregistrement
      puts 'annuler l enregistrement en cours ...'
      throw :abort

    end
  end
end
