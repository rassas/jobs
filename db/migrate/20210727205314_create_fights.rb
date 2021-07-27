class CreateFights < ActiveRecord::Migration[6.1]
  def change
    create_table :fights do |t|
      t.references :winner, foreign_key: {to_table: :caracters}

      t.timestamps
    end
  end
end
