class Postepolice < ApplicationRecord
  belongs_to :agent
  belongs_to :commissariat
  validates_presence_of :name, presence: true
  validates_presence_of :location, presence: true
end
