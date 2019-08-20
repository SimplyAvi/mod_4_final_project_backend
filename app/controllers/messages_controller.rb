class MessagesController < ApplicationController


    def create 
        message = Message.new(message_params)
        conversation = conversation.find(message_params[:params: conversation_id])
        if message.save
            serialized_data = AvtiveModelSerializers::Adapter::Json.new(
                MessageSerializer.new(message)
            ).serializable_hash
            MessageChannel.broadcast_to conversation, serialized_data
            head :ok
    end

private 

def message_params
    params.require(:message).permit(:text, :conversation_id)
end 

end
