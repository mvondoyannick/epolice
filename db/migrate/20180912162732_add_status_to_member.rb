class AddStatusToMember < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :status, :string
    add_column :members, :phone, :string
    add_column :members, :phone1, :string
    add_column :members, :phone2, :string
  end
end
