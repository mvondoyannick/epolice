class Contravetion < ApplicationRecord
  belongs_to :Agent
  belongs_to :User
  belong_to :Infraction
end
