class ChatRoom < ActiveRecord::Base
  has_many :users
  has_many :chat_messages
end
