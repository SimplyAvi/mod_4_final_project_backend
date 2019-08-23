class MessageSerializer < ActiveModel::Serializer
  # gives the attributes to the messages for the data structures needed
  attributes :id, :conversation_id, :text, :created_at
end
