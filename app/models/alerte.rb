class Alerte < ApplicationRecord
  belongs_to :ville
  belongs_to :type
  belongs_to :agent
  validates_presence_of :titre, presence: true
  validates_presence_of :description, presence: true
  validates_presence_of :type, presence: true
  validates_presence_of :ville, presence: true
  validates_presence_of :agent, presence: true
end
