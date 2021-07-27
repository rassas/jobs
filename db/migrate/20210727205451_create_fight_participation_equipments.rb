class CreateFightParticipationEquipments < ActiveRecord::Migration[6.1]
  def change
    create_table :fight_participation_equipments do |t|
      t.references :fight_participation, null: false, foreign_key: true
      t.references :equipment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
