class Unite < ApplicationRecord
  has_many :agents
  validates :name, presence: true, uniqueness: true
end
