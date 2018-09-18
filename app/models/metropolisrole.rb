class Metropolisrole < ApplicationRecord
  has_many :metropoli
  validates_presence_of :name, presence: true

end
