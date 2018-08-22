class Carrefour < ApplicationRecord
  before_save :set_image

  has_many :affectations
  belongs_to :ville
  validates_presence_of :name, presence: true

  private
  def set_image
    self.image = "image_tag('logo')"
  end
end
