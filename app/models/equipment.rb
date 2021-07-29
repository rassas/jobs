class Equipment < ApplicationRecord
  has_many :fight_participation_equipment
  has_many :fight_participations, through: :fight_participation_equipment
end
