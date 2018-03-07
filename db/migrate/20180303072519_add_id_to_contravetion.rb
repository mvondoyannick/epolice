class AddIdToContravetion < ActiveRecord::Migration[5.1]
  def change
    add_reference :contravetions, :User, foreign_key: true
  end
end
