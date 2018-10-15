class AddRegionToPostepolice < ActiveRecord::Migration[5.2]
  def change
    add_reference :postepolices, :region, foreign_key: true
  end
end
