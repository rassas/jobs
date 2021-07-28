class CreateCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :health_base_points
      t.integer :attack_base_points
      t.integer :experience

      t.timestamps
    end
  end
end
