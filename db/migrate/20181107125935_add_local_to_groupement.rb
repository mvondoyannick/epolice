class AddLocalToGroupement < ActiveRecord::Migration[5.2]
  def change
    add_column :groupements, :localisation, :string
  end
end
