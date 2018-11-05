class AddPhotoToAlerte < ActiveRecord::Migration[5.2]
  def change
    add_column :alertes, :photo, :string
  end
end
