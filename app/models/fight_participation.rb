class FightParticipation < ApplicationRecord
  belongs_to :fight
  belongs_to :character

  has_many :fight_participation_equipment
  has_many :equipment, through: :fight_participation_equipment
end
