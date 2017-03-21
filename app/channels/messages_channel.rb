class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "store"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def create_message(body)
    ActionCable.server.broadcast("store", {message: body})
  end
end
