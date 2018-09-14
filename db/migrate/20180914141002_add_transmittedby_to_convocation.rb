class AddTransmittedbyToConvocation < ActiveRecord::Migration[5.2]
  def change
    add_column :convocations, :transmittedby, :string
  end
end
