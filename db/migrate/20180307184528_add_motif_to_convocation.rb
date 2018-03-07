class AddMotifToConvocation < ActiveRecord::Migration[5.1]
  def change
    add_reference :convocations, :infraction, foreign_key: true
  end
end
