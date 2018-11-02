class AddPublisherToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :publisher, :string
  end
end
