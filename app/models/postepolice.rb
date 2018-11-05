class Postepolice < ApplicationRecord
  belongs_to :commissariat
  belongs_to :region

  validates :name, presence: {message: 'Merci d indiquer le nom du poste'}, uniqueness: {message: '%{value} existe déja'}
  validates :location, presence: {message: 'Merci de fournir la localisation'}, uniqueness: {message: '%{value} existe deja'}
end
