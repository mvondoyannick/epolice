class Structure < ApplicationRecord
  before_save :set_data
  belongs_to :region

  #gestion des documents de la structure
  has_one_attached :document
  has_one_attached :logo

  #active validation
  validates :name, presence: {message: "Merci de fournir de nom de la structure"}, uniqueness: {message: "%{value} existe deja."}, length: {minimum: 4, maximum: 50, message: "le nombre de caractere nest pas correcte"}
  validates :raison, presence: {message: "La raison est obligatoire"}
  validates :rue, presence: {message: "Merci de fournir une adresse"}
  validates :bp, presence: {message: "Merci de fournir une boite postale correcte"}, uniqueness: true
  validates :phonestructure, presence: {message: "Merci de fournir le numéro de téléphone de la structure"}, uniqueness: true
  validates :contactname, :contactphone, :contactemail, presence: {message: "Merci de fournir cette information"}
  validates :contactphone, presence: {message: "Numéro de téléphone obligatoire"}, length: {is: 9, message: "Doit avoir 9 chiffres"}, numericality: {only_integer: true, message: "Ce numéro n'est pas valide, uniquement des chiffres"}
  validates :logo, presence: {message: "Merci de fournir un logo."}
  validates :document, presence: {message: 'Merci de fournir le dossier de reference.'}
  validates :fonction, presence: {message: 'Merci de fournir la fonction'}

  private

  def set_data
    self.email = self.name.delete(' ').downcase+'-'+SecureRandom.hex(2)+'@epolice.cm'
    self.pwd = SecureRandom.hex(4).upcase
  end

end
