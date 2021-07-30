class Character < ApplicationRecord
  has_many :fight_participations, dependent: :destroy
  has_many :fights, through: :fight_participations
  
  has_many :won_fights, class_name: "Fight", foreign_key: "winner_id"

  def available_equipment
    Equipment.where("required_experience >= ?", experience)
  end

  def available_weapons
    Weapon.where("required_experience >= ?", experience)
  end

  def available_shield
    Shield.where("required_experience >= ?", experience)
  end

  def win_rate
    return unless fights.exists?
    won_fights.count * 100 / fights.count
  end
end
