# class MessagesController < ApplicationController

#     def index
#         @message = Message.all 
#         render json: @message
#     end 

#     # creating the message
#     def create 
#         message = Message.new(message_params)
#         conversation = Conversation.find(message_params[:conversation_id])
#         if message.save
#             # makes the data look the right way as well as added some brands to it
#             serialized_data = MessageSerializer.new(message)
#             ).serializable_hash
#             # gives the live data to a specific conversation id - ideally make the chat into different folders for later
#              MessagesChannel.broadcast_to conversation, serialized_data 
#             # ConversationsChannel.broadcast_to conversation, serialized_data 
#             head :ok
#         end
#     end

#     private 

#     def message_params
#         params.permit(:text, :conversation_id)
#     end 

# end


class MessagesController < ApplicationController

 def index
        @message = Message.all 
        render json: @message
    end 


  def create
    message = Message.new(message_params)
    conversation = Conversation.find(message_params[:conversation_id])
    if message.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        MessageSerializer.new(message)
      ).serializable_hash
      MessagesChannel.broadcast_to conversation, serialized_data
    #   head :ok
    render json: message
    end
  end
  
  private
  
  def message_params
    params.require(:message).permit(:text, :conversation_id)
  end
end

