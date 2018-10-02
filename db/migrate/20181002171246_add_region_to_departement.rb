class AddRegionToDepartement < ActiveRecord::Migration[5.2]
  def change
    add_reference :departements, :region, foreign_key: true
  end
end
