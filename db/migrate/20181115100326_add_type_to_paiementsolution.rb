class AddTypeToPaiementsolution < ActiveRecord::Migration[5.2]
  def change
    add_column :paiementsolutions, :type, :string
  end
end
