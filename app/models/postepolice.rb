class Postepolice < ApplicationRecord
  belongs_to :agent
  belongs_to :commissariat
  belongs_to :region
  belongs_to :grade

  validates :name, presence: {message: 'Merci d indiquer le nom du poste'}, uniqueness: {message: '%{value} existe déja'}
  validates :location, presence: {message: 'Merci de fournir la localisation'}, uniqueness: {message: '%{value} existe deja'}
  validates :email, :phone, presence: {message: 'Informations manquante'}, uniqueness: true

  validates_presence_of :name, presence: true
  validates_presence_of :location, presence: true
end
