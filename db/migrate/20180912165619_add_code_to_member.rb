class AddCodeToMember < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :code, :string
  end
end
