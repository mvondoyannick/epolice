class Departement < ApplicationRecord
  belongs_to :ville
  has_many :commissariat
  validates :name, presence: true, uniqueness: true
end
