class AddPhoneToPostepolice < ActiveRecord::Migration[5.2]
  def change
    add_column :postepolices, :phone, :string
    add_column :postepolices, :email, :string
    add_reference :postepolices, :grade, foreign_key: true
  end
end
