class AddIdToConvocation < ActiveRecord::Migration[5.1]
  def change
    add_reference :convocations, :agent, foreign_key: true
  end
end
