class Centrerecouvrement < ApplicationRecord
  before_save :set_email
  belongs_to :region

  def set_email
    self.email = self.name.delete(' ').downcase+'-'+SecureRandom.hex(2)+'@epolice.cm'
  end
end
