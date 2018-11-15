class AddAvatarToAgent < ActiveRecord::Migration[5.2]
  def change
    add_column :agents, :avatar, :string
  end
end
