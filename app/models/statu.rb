class Statu < ApplicationRecord
    has_many :alerte
    validates_presence_of :name, presence: true
    validates_presence_of :detail, presence: true
end
