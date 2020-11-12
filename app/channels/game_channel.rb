class GameChannel < ApplicationCable::Channel
  def subscribed
    game = Game.find(params[:id])
    stream_for game
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive data
    game = Game.find(params[:id])

    GameChannel.broadcast_to game, data
  end
end
