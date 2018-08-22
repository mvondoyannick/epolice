class Affectation < ApplicationRecord
  belongs_to :agent
  belongs_to :carrefour
  validates_presence_of :date, presence: true
  validates_presence_of :fin, presence: true
end
