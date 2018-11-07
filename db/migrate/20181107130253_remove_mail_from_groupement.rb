class RemoveMailFromGroupement < ActiveRecord::Migration[5.2]
  def change
    remove_column :groupements, :mail, :string
  end
end
