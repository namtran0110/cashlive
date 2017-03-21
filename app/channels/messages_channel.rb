class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "store"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def create_message(message_params)
    Rails.logger.info("create message #{message_params.inspect}")

    @message = Message.new message_params.slice('body')
    @message.store_id = 10
    if current_user
      @message.user_id = current_user.id
    end

    data = {}

    if @message.save
      data[:html] = render_message(@message)
    else
      data[:html] = "Error: #{@message.errors.full_messages.to_sentence}"
    end

    ActionCable.server.broadcast("store", data)
  end

  def render_message(message)
    ApplicationController.render partial: 'messages/message', locals: {message: message}
  end
end
