class Paiementsolution < ApplicationRecord
  has_one_attached :image
  validates :name, presence: {message: 'Merci de saisir le nom de solution'}, uniqueness: {message: 'Cette valeur existe deja'}
  validates :image, presence: {message: 'Merci de fournir une image'}, uniqueness: {message: 'Cette image existe deja'}
end
