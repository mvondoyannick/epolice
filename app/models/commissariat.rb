class Commissariat < ApplicationRecord
  belongs_to :ville
  has_many :agent
  validates_presence_of :name, presence: true
end
