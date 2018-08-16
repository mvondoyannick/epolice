class Service < ApplicationRecord
    has_many :type
    validates_presence_of :detail, presence: true
    validates_presence_of :name, presence: true
end
