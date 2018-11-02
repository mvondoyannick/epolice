class Comment < ApplicationRecord
  belongs_to :alerte

  validates :title, presence: true
  validates :content, presence: true
end
