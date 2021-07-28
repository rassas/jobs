class Character < ApplicationRecord
  has_many :fight_participations
  has_many :fights, through: :fight_participations

  def available_equipments
    Equipment.where("required_experience >= ?", experience)
  end

  def available_weapons
    Weapon.where("required_experience >= ?", experience)
  end

  def available_shield
    Shield.where("required_experience >= ?", experience)
  end
end
