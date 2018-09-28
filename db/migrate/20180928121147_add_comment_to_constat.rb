class AddCommentToConstat < ActiveRecord::Migration[5.2]
  def change
    add_column :constats, :comment, :string
    add_column :constats, :latitude, :string
    add_column :constats, :longitude, :string
  end
end
