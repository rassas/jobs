class AddDefaultValueToCharacterExperience < ActiveRecord::Migration[6.1]
  def change
    change_column :characters, :experience, :integer, default: 0
  end
end
