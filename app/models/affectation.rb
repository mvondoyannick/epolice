class Affectation < ApplicationRecord
  before_save :set_token
  belongs_to :agent
  belongs_to :postepolice
  belongs_to :commissariat
  belongs_to :region
  validates_presence_of :debut, presence: true
  validates_presence_of :fin, presence: true

  def complete_name
    Agent.find(self.id).name+' '+Agent.find(self.id).prenom
  end

  def complete_name_other

  end

  private
  def set_token
    self.token = SecureRandom.hex(3).upcase if self.token.nil?
    self.status = "actif" #token automatiquement actif, son inverse est perime
  end
end
