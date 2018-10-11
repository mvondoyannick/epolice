class Member < ApplicationRecord
  before_save :set_status
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :lockable, :timeoutable, :trackable

  belongs_to :service
  belongs_to :region

  private

  def set_status
    #self.status = 'inactive'
    self.code = SecureRandom.hex(10).upcase
  end
end