class Fight < ApplicationRecord
  belongs_to :winner, optional: true
  has_many :fight_participations
  has_many :character, through: :fight_participations
  accepts_nested_attributes_for :fight_participations
end
