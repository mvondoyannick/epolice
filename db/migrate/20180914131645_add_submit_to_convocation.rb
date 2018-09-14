class AddSubmitToConvocation < ActiveRecord::Migration[5.2]
  def change
    add_column :convocations, :submit, :string
  end
end
