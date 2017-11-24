class User < ApplicationRecord
  # validates :name, presence: true, uniqueness: true
  # has_many :challenge_mets
  # has_many :matches

  # alias_method :challenges_met, :challenge_mets
  #
  # def self.find_or_create(name)
  #   user = (find_by(name: name) || new(name: name))
  # end
  #
  # def increment_wins!
  #   initial_wins = self.wins || 0
  #   self.update_attributes!(wins: initial_wins + 1)
  # end
  #
  # def assign_challenge_met(challenge_id)
  #   challenge = challenges.build(name: challenge_id)
  #   challenge.save!
  # end
  #
  # def matches_won
  #   Match.where(winner: self.name)
  # end
end
