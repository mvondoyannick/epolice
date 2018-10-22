class Grade < ApplicationRecord
    before_commit :set_description

    has_many :agent
    validates :name, presence: true, uniqueness: true

    private

    def set_description
        self.detail = "Aucune description" if self.detail.nil?
    end
end
