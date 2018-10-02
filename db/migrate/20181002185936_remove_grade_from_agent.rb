class RemoveGradeFromAgent < ActiveRecord::Migration[5.2]
  def change
    remove_column :agents, :grade, :string
  end
end
