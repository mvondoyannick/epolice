class AddRegionToCentrepartenaire < ActiveRecord::Migration[5.2]
  def change
    add_reference :centrepartenaires, :region, foreign_key: true
  end
end
