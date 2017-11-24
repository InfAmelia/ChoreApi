# class ChallengeMet < ApplicationRecord
#   belongs_to :player
#   belongs_to :challenge
#
#   def self.award(player_name, challenge_id)
#     if (challenge = Challenge.find(challenge_id))
#       player = Player.find_by(name: player_name)
#       self.create!(player: player, challenge: challenge)
#     end
#   end
# end
