class AddCommissariatToFylo < ActiveRecord::Migration[5.2]
  def change
    add_reference :fylos, :commissariat, foreign_key: true
  end
end
