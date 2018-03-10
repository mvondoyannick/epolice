class Affectation < ApplicationRecord
  belongs_to :type
  belongs_to :agent
  belongs_to :carrefour
  validates_presence_of :date, presence: true
end
