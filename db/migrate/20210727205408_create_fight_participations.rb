class CreateFightParticipations < ActiveRecord::Migration[6.1]
  def change
    create_table :fight_participations do |t|
      t.references :fight, null: false, foreign_key: true
      t.references :caracter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
