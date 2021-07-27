class CreateEquipment < ActiveRecord::Migration[6.1]
  def change
    create_table :equipment do |t|
      t.string :name
      t.integer :attack_points
      t.integer :defense_points
      t.integer :required_experience
      t.string :type

      t.timestamps
    end
  end
end
