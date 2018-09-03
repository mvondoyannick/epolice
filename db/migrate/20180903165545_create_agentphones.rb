class CreateAgentphones < ActiveRecord::Migration[5.2]
  def change
    create_table :agentphones do |t|
      t.string :phone
      t.string :fingerprint
      t.string :imei

      t.timestamps
    end
  end
end
