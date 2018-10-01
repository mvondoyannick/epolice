class Region < ApplicationRecord
  has_many :infraction
  has_many :commissariat
end
