class Departement < ApplicationRecord
  belongs_to :ville
  has_many :commissariat
end
