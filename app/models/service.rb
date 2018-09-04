class Service < ApplicationRecord
    belongs_to :type
    validates_presence_of :detail, presence: true
    validates_presence_of :name, presence: true
end
