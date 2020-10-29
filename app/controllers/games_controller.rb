class GamesController < ApplicationController
	def index
		games = Games.all
		render json: games
	end

	def create 
		game = Game.new(game_params)
		if game.save
			GameChannel.broadcast_to(game, game)
		else
			render json: {errors: "can't save"}, status: 422
		end
	end

	def show
		game = Game.find(params[:id])
		render json: game
	end

	private

	def game_params
		params.require(:game).permit(:sgf)
	end

	def move_params
		params.require(:move).permit(:position)
	end
end
