class ConversationSerializer < ActiveModel::Serializer
  # gives the data the different hash properties it needs for the conversation
  attributes :id, :title
  has_many :messages
end
