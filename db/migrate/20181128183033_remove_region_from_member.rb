class RemoveRegionFromMember < ActiveRecord::Migration[5.2]
  def change
    remove_reference :members, :region, foreign_key: true
    remove_reference :members, :service, foreign_key: true
  end
end
