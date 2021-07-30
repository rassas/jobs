class FightParticipation < ApplicationRecord
  belongs_to :fight
  belongs_to :character

  has_many :fight_participation_equipments
  has_many :equipment, through: :fight_participation_equipments
  accepts_nested_attributes_for :fight_participation_equipments

  has_many :fight_participation_weapons, class_name: "FightParticipationEquipment"
  has_many :weapons, -> { where(type: "Weapon") }, through: :fight_participation_weapons, source: :equipment
  accepts_nested_attributes_for :fight_participation_weapons

  has_many :fight_participation_shields, class_name: "FightParticipationEquipment"
  has_many :shields, -> { where(type: "Shield") }, through: :fight_participation_shields, source: :equipment
  accepts_nested_attributes_for :fight_participation_shields
end
