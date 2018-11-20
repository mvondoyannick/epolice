class AddCodeToTransfert < ActiveRecord::Migration[5.2]
  def change
    add_column :transferts, :code, :string
    add_column :transferts, :status_code, :string
    add_column :transferts, :expire_in, :string
  end
end
