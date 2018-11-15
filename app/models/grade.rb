class Grade < ApplicationRecord
    before_commit :set_description

    has_many :agent
    validates :name, presence: {message: 'Merci de remplir ce champ'}, uniqueness: {message: '%{value} existe deja.', case_sensitive: true}

    private

    def set_description
        self.detail = "Aucune description" if self.detail.nil?
    end
end
