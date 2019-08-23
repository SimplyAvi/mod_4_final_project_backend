class MessagesChannel < ApplicationCable::Channel
  def subscribed
    conversation = Conversation.find(params[:conversation])
    stream_for conversation
  end

  def unsubscribed
    raise "error"
    # Any cleanup needed when channel is unsubscribed
  end
end
