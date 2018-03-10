class Status < ApplicationRecord
  belongs_to :affectation
  validates_presence_of :name, presence: true
end
