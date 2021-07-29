class AddDefaultValueToCharacterExperience < ActiveRecord::Migration[6.1]
  def self.up
    change_column :characters, :experience, :integer, default: 0
  end

  def self.down
    change_column :characters, :experience, :integer
  end
end
