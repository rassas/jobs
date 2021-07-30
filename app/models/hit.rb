class Hit < ApplicationRecord
  belongs_to :fight_participation_weapon,
    class_name: "FightParticipationEquipment",
    foreign_key: "fight_participation_equipment_id",
    optional: :true
  belongs_to :fight_participation

  after_initialize :pick_weapon!

  def pick_weapon!
    return if self.persisted? || fight_participation.nil?

    self.fight_participation_weapon = fight_participation.fight_participation_weapons.joins(:equipment).where(equipment: { type: "Weapon" }).order(Arel.sql('RANDOM()')).first
    self.damage = rand(fight_participation.character.attack_base_points + self.fight_participation_weapon&.equipment&.attack_points.to_i)
  end
end
