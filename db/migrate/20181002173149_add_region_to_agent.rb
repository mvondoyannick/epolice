class AddRegionToAgent < ActiveRecord::Migration[5.2]
  def change
    add_reference :agents, :region, foreign_key: true
  end
end
