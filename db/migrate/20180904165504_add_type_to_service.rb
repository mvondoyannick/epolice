class AddTypeToService < ActiveRecord::Migration[5.2]
  def change
    add_reference :services, :type, foreign_key: true
  end
end
