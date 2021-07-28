class FightParticipation < ApplicationRecord
  belongs_to :fight
  belongs_to :character

  has_many :fight_participation_equipments
  has_many :equipments, through: :fight_participation_equipments
end
