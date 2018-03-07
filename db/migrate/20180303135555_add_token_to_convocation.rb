class AddTokenToConvocation < ActiveRecord::Migration[5.1]
  def change
    add_column :convocations, :token, :string
  end
end
