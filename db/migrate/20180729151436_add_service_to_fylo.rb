class AddServiceToFylo < ActiveRecord::Migration[5.2]
  def change
    add_column :fylos, :service, :string
  end
end
