class Ville < ApplicationRecord
  has_many :commissariat
  validates_presence_of :name, presence: true
end
