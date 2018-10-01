class AddArrondissementToCommissariat < ActiveRecord::Migration[5.2]
  def change
    add_reference :commissariats, :arrondissement, foreign_key: true
  end
end
