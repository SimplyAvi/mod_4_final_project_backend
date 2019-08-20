class ConversationsController < ApplicationController

    def index
        conversation = Conversation.all
        render json: conversation
    end 

    def create 
        conversation = Conversation.new(conversation_params)
        if conversation.save 
            serialized_data = ConversationSerializer.new(conversation)
            ActionCable.server.broadcast "conversations_channel", serialized_data
            head :okay
        end
    end


    private 

    def conversation_params
        params.permit(:title)
    end 




end
