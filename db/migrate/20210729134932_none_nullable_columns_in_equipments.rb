class NoneNullableColumnsInEquipments < ActiveRecord::Migration[6.1]
  def self.up
    change_column :equipment, :type,                :string,  null: false
    change_column :equipment, :name,                :string,  null: false
    change_column :equipment, :attack_points,       :integer, default: 0
    change_column :equipment, :defense_points,      :integer, default: 0
    change_column :equipment, :required_experience, :integer, default: 0
  end

  def self.down
    change_column :equipment, :type,                :string,  null: true
    change_column :equipment, :name,                :string,  null: true
    change_column :equipment, :attack_points,       :integer
    change_column :equipment, :defense_points,      :integer
    change_column :equipment, :required_experience, :integer
  end
end
