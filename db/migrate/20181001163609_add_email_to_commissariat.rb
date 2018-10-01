class AddEmailToCommissariat < ActiveRecord::Migration[5.2]
  def change
    add_column :commissariats, :email, :string
  end
end
