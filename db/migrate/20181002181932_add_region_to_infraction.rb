class AddRegionToInfraction < ActiveRecord::Migration[5.2]
  def change
    add_reference :infractions, :region, foreign_key: true
  end
end
