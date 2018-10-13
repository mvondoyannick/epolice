class Type < ApplicationRecord
  before_save :empty_array
  validates :name, presence: true, uniqueness: true

  private

  def empty_array
    self.entity = Array.new #eval
    self.entity = self.entity

  end
end
