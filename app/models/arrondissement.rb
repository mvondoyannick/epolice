class Arrondissement < ApplicationRecord
  belongs_to :region
  belongs_to :departement
  belongs_to :ville
  has_many :commissariat
end
