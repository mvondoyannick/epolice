class Groupement < ApplicationRecord
  before_save :set_email
  belongs_to :region
  belongs_to :agent

  validates :name, presence: true, uniqueness: true
  validates :phone, presence: true, uniqueness: true

  def set_email
    self.email = self.name.delete(' ').downcase+'-'+SecureRandom.hex(2)+'@epolice.cm'
  end
end
