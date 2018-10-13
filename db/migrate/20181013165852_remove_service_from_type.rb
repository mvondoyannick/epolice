class RemoveServiceFromType < ActiveRecord::Migration[5.2]
  def change
    remove_reference :types, :service, foreign_key: true
  end
end
