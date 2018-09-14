class AddBuyToConvocation < ActiveRecord::Migration[5.2]
  def change
    add_column :convocations, :buy, :string
  end
end
