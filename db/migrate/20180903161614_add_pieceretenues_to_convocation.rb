class AddPieceretenuesToConvocation < ActiveRecord::Migration[5.2]
  def change
    add_reference :convocations, :pieceretenu, foreign_key: true
  end
end
