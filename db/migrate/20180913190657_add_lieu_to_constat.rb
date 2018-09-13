class AddLieuToConstat < ActiveRecord::Migration[5.2]
  def change
    add_column :constats, :lieu, :string
  end
end
