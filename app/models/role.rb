class Role < ApplicationRecord
    has_many :fylo
    has_many :admin
    validates_presence_of :name, presence: true
    validates_presence_of :detail, presence: true
end
