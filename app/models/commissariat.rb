class Commissariat < ApplicationRecord
  belongs_to :region
  belongs_to :departement
  belongs_to :arrondissement
  belongs_to :agent
end
