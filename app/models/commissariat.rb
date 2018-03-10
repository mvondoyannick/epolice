class Commissariat < ApplicationRecord
  belongs_to :ville
  has_many :agent
  validates_presence_of :name, presence: true
  validates_uniqueness_of :name
  validates_presence_of :quartier, presence: true, uniquenes: true
  validates_presence_of :phone, presence: true, uniqueness: true
end
