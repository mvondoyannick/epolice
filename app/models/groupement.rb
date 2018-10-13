class Groupement < ApplicationRecord
  belongs_to :region
  belongs_to :agent
end
