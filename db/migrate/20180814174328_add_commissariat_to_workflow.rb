class AddCommissariatToWorkflow < ActiveRecord::Migration[5.2]
  def change
    add_reference :workflows, :commissariat, foreign_key: true
  end
end
