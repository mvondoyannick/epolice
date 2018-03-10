class AddTypeNameToAlerte < ActiveRecord::Migration[5.1]
  def change
    add_reference :alertes, :type, foreign_key: true
  end
end
