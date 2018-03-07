class CreateJoinTableConvocationsInfractions < ActiveRecord::Migration[5.1]
  def change
    create_join_table :convocations, :infractions do |t|
      # t.index [:convocation_id, :infraction_id]
      # t.index [:infraction_id, :convocation_id]
    end
  end
end
