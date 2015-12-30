class Message < ActiveRecord::Base
	belongs_to :user
	belongs_to :chat_room

  def self.newmessage(content, user_id, chat_room_id)
    @message = Message.new
    @message.content = content
    @message.time = DateTime.now
    @message.user_id = user_id
    @message.chat_room_id = chat_room_id
    @message.save
    @message
  end
  
end
