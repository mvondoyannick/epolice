class Ville < ApplicationRecord
  has_many :commissariat
  has_many :carrefour
  validates_presence_of :name, presence: true
  validates_uniqueness_of :name
  validates_numericality_of :long, :lat
end
