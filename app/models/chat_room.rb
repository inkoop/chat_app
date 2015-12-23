class ChatRoom < ActiveRecord::Base
	has_many :user_chat_rooms 
	has_many :user, :through => :user_chat_room
	has_many :messages
	has_many :uploadfiles

  def self.search_room(chatroom, user)
    chatroom_details = ChatRoom.find_by_name(chatroom)
    if chatroom_details.nil? #if the chatroom is not available 
      return create_room(chatroom, user)
          # puts "user is enter into a searched and newly created chat room redirect to the new room" 
    else                                    #if the chatroom is available 
      if chatroom_details.is_public #if the search room name is public
          puts "user is enter into a searched and existing chat room redirect to the room"
          return chatroom_details
      else                                  #if the search room name is not public(private)
          #check the user details 
          puts "it is private chat room"
          if user.chat_rooms.find_by id: chatroom_details.id
            return chatroom_details  
          else
            return nil
          end
          
      end
    end     
  end

  def self.create_room(chatroom, user) 
    @chatroom = ChatRoom.new
    @chatroom.name = chatroom
    @chatroom.is_public = true
    @chatroom.save
    user_chat_room = UserChatRoom.create(user_id: user.id, chat_room_id: @chatroom.id)
    @chatroom
  end
end
