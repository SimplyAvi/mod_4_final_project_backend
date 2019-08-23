# class ConversationsController < ApplicationController

#     # Loads all of the conversations from the server
#     def index
#         conversations = Conversation.all
#         render json: conversations
#     end 

#     # Create a specific conversation
#     def create 
#         conversation = Conversation.new(conversation_params)
#         if conversation.save 
#             serialized_data = ConversationSerializer.new(conversation)
#     # Broadcasts the data to conversations_channel which we will want to use to render onto the screen
#             ActionCable.server.broadcast "conversations_channel", serialized_data
#             head :ok
#         end
#     end


#     private 

#     def conversation_params
#         params.permit(:title)
#     end 




# end


class ConversationsController < ApplicationController
  def index
    conversations = Conversation.all
    render json: conversations
  end

  def create
    conversation = Conversation.new(conversation_params)
    if conversation.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        ConversationSerializer.new(conversation)
      ).serializable_hash
      ActionCable.server.broadcast 'conversations_channel', serialized_data
    #   head :ok
    render json: conversation
    end
  end
  
  private
  
  def conversation_params
    params.require(:conversation).permit(:title)
  end
end