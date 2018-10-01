class AddRegionToCommissariat < ActiveRecord::Migration[5.2]
  def change
    add_reference :commissariats, :region, foreign_key: true
  end
end
