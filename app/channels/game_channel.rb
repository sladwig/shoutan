class GameChannel < ApplicationCable::Channel
  def subscribed
    # puts "Yeah here the params", params[:game]
    # game = Game.find (params[:id])
    stream_for "game_#{params[:game]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    # puts params, "yeah", params[:game]
    # game = Game.find(params[:id])

    GameChannel.broadcast_to "game_#{params[:game]}", data
  end
end
