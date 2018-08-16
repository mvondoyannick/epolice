class Fylo < ApplicationRecord
    belongs_to :role
    validates_presence_of :name, presence: true, uniqueness: true
    validates_presence_of :prenom, presence: true
    validates_presence_of :phone, presence: true, uniqueness: true
    validates_presence_of :email, presence: true, uniqueness: true
end
