class AddServiceToType < ActiveRecord::Migration[5.2]
  def change
    add_reference :types, :service, foreign_key: true
  end
end
