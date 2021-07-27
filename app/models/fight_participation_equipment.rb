class FightParticipationEquipment < ApplicationRecord
  belongs_to :fight_participation
  belongs_to :equipment
end
