class User < ActiveRecord::Base
	has_many :user_chat_room 
	has_many :chat_room, :through => :user_chat_room
	has_many :messages
	has_many :uploadfiles
end
