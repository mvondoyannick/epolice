class AddRegionToAlerte < ActiveRecord::Migration[5.2]
  def change
    add_reference :alertes, :region, foreign_key: true
  end
end
