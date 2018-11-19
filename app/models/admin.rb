class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar
  belongs_to :role

  #active record validation here
  validates :phone, presence: {message: 'Merci de fournir le telephone'}, uniqueness: {message: '%{value} existe déja.'}
  validates :email, presence: {message: 'Merci de fournir l email'}, uniqueness: {message: '%{value} existe déja.'}
end
