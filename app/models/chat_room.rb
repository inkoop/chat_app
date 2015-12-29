class ChatRoom < ActiveRecord::Base
	has_many :user_chat_rooms 
	has_many :user, :through => :user_chat_room
	has_many :messages
	has_many :uploadfiles

  def self.search_room(chatroom, user, is_new)
    chatroom_details = ChatRoom.find_by_name(chatroom)
    if chatroom_details.nil? #if the chatroom is not available 
      return create_room(chatroom, user)
    else                                    #if the chatroom is available 
      if chatroom_details.is_public #if the search room name is public
        if is_new                   #new user enters into old room
          user_chat_room = UserChatRoom.create(user_id: user.id, chat_room_id: chatroom_details.id)
        end
        return chatroom_details
      else                                  #if the search room name is not public(private)
          if user.chat_rooms.find_by id: chatroom_details.id            #check the user details 
            return chatroom_details  
          else
            return nil
          end
          
      end
    end     
  end

  def self.create_room(chatroom, user) 
    #token_letters = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
    #token = (0...8).map { token_letters[rand(token_letters.length)] }.join

    token = SecureRandom.hex(5)
    until ChatRoom.find_by(token: token).nil?
      token = SecureRandom.hex(5)
    end
    
    @chatroom = ChatRoom.new
    @chatroom.name = chatroom
    @chatroom.is_public = true
    @chatroom.token = token
    @chatroom.save
    user_chat_room = UserChatRoom.create(user_id: user.id, chat_room_id: @chatroom.id)
    @chatroom
  end
end
