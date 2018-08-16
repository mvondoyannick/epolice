class AddGradeToAgent < ActiveRecord::Migration[5.2]
  def change
    add_reference :agents, :grade, foreign_key: true
  end
end
