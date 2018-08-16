class Workflow < ApplicationRecord
    belongs_to :contravetion
    belongs_to :agent
    belongs_to :commissariat
end
