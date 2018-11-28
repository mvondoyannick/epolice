class PostCommissariat < ApplicationRecord
  belongs_to :commissariat
  belongs_to :agent
  belongs_to :grade
end
