class Alerte < ApplicationRecord
  belongs_to :ville
  belongs_to :type
  belongs_to :agent
  validates_presence_of :titre, presence: true
  validates_presence_of :description, presence: true
  validates_presence_of :type, presence: true
  validates_presence_of :ville, presence: true
  validates_presence_of :agent, presence: true
  validates_presence_of :longitude, presence: true
  validates_presence_of :latitude, presence: true

  #ajout de active storage pour les fichiers
  has_one_attached :alertes
end
