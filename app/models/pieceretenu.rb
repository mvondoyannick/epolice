class Pieceretenu < ApplicationRecord
  validates_presence_of :name, presence: true, message: "Saisir le nom"
  has_many :convocations
end
