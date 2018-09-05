class Alerte < ApplicationRecord
  before_save :init

  belongs_to :ville
  belongs_to :type
  belongs_to :agent
  belongs_to :statu
  validates_presence_of :titre, presence: true
  validates_presence_of :description, presence: true
  validates_presence_of :type, presence: true
  validates_presence_of :ville, presence: true
  validates_presence_of :agent, presence: true
  validates_presence_of :longitude, presence: true
  validates_presence_of :latitude, presence: true

  #ajout de active storage pour les fichiers
  has_one_attached :alertes

  private
  def init
    self.statu_id = Statu.last.id
    self.action = "Aucune action pour le moment"
    self.date = Date.today
    self.longitude = Base64.decode64(self.longitude)
    self.latitude = Base64.decode64(self.latitude)
    self.description = Base64.decode64(self.description)
    #self.alertes.attach(Base64.encode64("public/assets/homework-3235100_1280.jpeg"))
  end
end
