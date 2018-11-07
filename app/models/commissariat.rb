class Commissariat < ApplicationRecord
  before_save :set_email
  belongs_to :region
  belongs_to :departement
  belongs_to :arrondissement
  #belongs_to :agent

  validates :name, presence: true, uniqueness: {message: '%{value} existe deja.', case_sensitive: false}
  validates :phone, presence: true, uniqueness: {message: '%{value} existe deja.', case_sensitive: false}, length: {is: 9, message: '%{value} doit contenir 9 chiffres'}, numericality: { only_integer: true }
  #validates :email, presence: true, uniqueness: {message: '%{value} existe deja.', case_sensitive: false}

  private
  def set_email
    self.email = self.name.delete(' ').downcase+'-'+SecureRandom.hex(2)+'@epolice.cm' unless self.email.nil?
  end
end
