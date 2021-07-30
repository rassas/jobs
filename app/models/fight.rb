class Fight < ApplicationRecord
  belongs_to :winner, class_name: "Character", optional: true
  has_many :fight_participations, dependent: :destroy
  has_many :characters, through: :fight_participations
  has_many :hits, through: :fight_participations, dependent: :destroy
  accepts_nested_attributes_for :fight_participations
  
  after_create :confront!

  def confront!
    hitter_participation = fight_participations.first
    hitted_participation = fight_participations.last
    loop do
      hit = hitter_participation.hits.create()
      hitted_participation.health_points -= hit.damage

      break if hitted_participation.health_points <= 0
      hitter_participation, hitted_participation = hitted_participation, hitter_participation
    end
    update(winner: hitter_participation.character)
    loser.update(experience: loser.experience.to_i + 4)
    winner.update(experience: winner.experience.to_i + 8)
  end

  def loser
    return if winner.nil?

    characters.where.not(id: winner.id).last
  end
end
