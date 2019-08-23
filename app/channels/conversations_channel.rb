class ConversationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "conversations_channel"
  end

  def unsubscribed
    raise "error"
    # Any cleanup needed when channel is unsubscribed
  end
end
