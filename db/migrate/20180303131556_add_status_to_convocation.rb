class AddStatusToConvocation < ActiveRecord::Migration[5.1]
  def change
    add_column :convocations, :status, :string
  end
end
