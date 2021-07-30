class FightParticipation < ApplicationRecord
  belongs_to :fight
  belongs_to :character

  has_many :fight_participation_equipments, dependent: :destroy
  has_many :equipment, through: :fight_participation_equipments
  accepts_nested_attributes_for :fight_participation_equipments

  has_many :fight_participation_weapons, class_name: "FightParticipationEquipment"
  has_many :weapons, -> { where(type: "Weapon") }, through: :fight_participation_weapons, source: :equipment
  accepts_nested_attributes_for :fight_participation_weapons

  has_many :fight_participation_shields, class_name: "FightParticipationEquipment"
  has_many :shields, -> { where(type: "Shield") }, through: :fight_participation_shields, source: :equipment
  accepts_nested_attributes_for :fight_participation_shields

  has_many :hits, dependent: :destroy

  attribute :health_points, :integer

  after_initialize :set_default_health_points
  
  private

  def set_default_health_points
    return if character.nil?

    self.health_points = character.health_base_points + shields.sum(:defense_points)
  end
end
