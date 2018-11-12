class Type < ApplicationRecord
  require 'json'

  before_save :clean_empty_array_value

  #enabled active record validation
  validates :name, presence: true, uniqueness: true

  private
  def clean_empty_array_value
    data = JSON.parse self.entity
    self.entity = data.reject(&:empty?)
  end

end
