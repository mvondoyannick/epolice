class Langue < ApplicationRecord
  validates :name, presence: {message: 'Ne peut etre vide'}, uniqueness: {message: '%{value} existe deja.'}
end
