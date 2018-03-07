class AddCodeToConvocation < ActiveRecord::Migration[5.1]
  def change
    add_column :convocations, :code, :string
  end
end
