class AddStatuToAlerte < ActiveRecord::Migration[5.2]
  def change
    add_reference :alertes, :statu, foreign_key: true
  end
end
