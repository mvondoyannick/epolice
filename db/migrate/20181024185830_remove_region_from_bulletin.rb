class RemoveRegionFromBulletin < ActiveRecord::Migration[5.2]
  def change
    remove_reference :bulletins, :region, foreign_key: true
  end
end
