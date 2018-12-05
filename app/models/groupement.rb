class Groupement < ApplicationRecord
  before_save :set_email
  belongs_to :region

  validates :name, presence: true, uniqueness: {message: '%{value} a déja été choisis.', case_sensitive: false}
  validates :phone, presence: true, uniqueness: true
  validates :region_id, presence: {message: 'Remplire la region'}, uniqueness: {message: "Cette région est deja existante."}

  def set_email
    #mise a jour de la casse du grvpc
    self.name = self.name[0..4].upcase+self.name[5..self.name.length]
    self.email = self.name.delete(' ').downcase+'-'+SecureRandom.hex(2)+'@epolice.cm' unless self.email.nil?

    #mise a jour de l'ecriture de groupement
    #self.name =
  end
end
