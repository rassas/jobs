class Equipment < ApplicationRecord
  has_many :fight_participation_equipments
  has_many :fight_participations, through: :fight_participation_equipments
end
