class ChatRoom < ActiveRecord::Base
	has_many :user_chat_room 
	has_many :user, :through => :user_chat_room
	has_many :messages
	has_many :uploadfiles
end
