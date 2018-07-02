class Game < ApplicationRecord
	def self.start(player1, player2)

	cross, nought = [player1,player2].shuffle

	ActionCable.server.broadcast "player_#{cross}", {action: "game_start", msg: "Cross"}
	ActionCable.server.broadcast "player_#{nought}", {action: "game_start", msg: "Nought"}

	Redis.set("opponent_for:#{cross}",nought)
	Redis.set("opponent_for:#{nought}",cross)

	end

end
