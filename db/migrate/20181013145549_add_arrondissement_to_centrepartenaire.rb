class AddArrondissementToCentrepartenaire < ActiveRecord::Migration[5.2]
  def change
    add_reference :centrepartenaires, :arrondissement, foreign_key: true
  end
end
