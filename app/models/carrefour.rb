class Carrefour < ApplicationRecord
  has_many :affectations
  validates_presence_of :name, presence: true
end
