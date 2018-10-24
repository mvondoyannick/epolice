class Centrepartenaire < ApplicationRecord
  belongs_to :structure
  belongs_to :region
  belongs_to :departement
  belongs_to :arrondissement

  validates :localisation, presence: {message: 'La localisation est obligatoire.'}
  validates :name, presence: {message: 'Le nom du responsable est obliatoire.'}
  validates :fonction, presence: {message: 'La fontion est obligatoire.'}
  validates :phone, presence: {message: 'Le numéro de téléphone est obligatoire.'}, uniqueness: {message: '%{value} a deja été utilisé'}, length: {is: 9, message: 'Le numero doit comporter 9 chiffres'}

  def custom_email

  end
end
