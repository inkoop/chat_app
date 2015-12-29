class User < ActiveRecord::Base
	has_many :user_chat_rooms
	has_many :chat_rooms, :through => :user_chat_rooms
	has_many :messages
	has_many :uploadfiles

	def self.authendicateuser(userparam, chatroom)
    #puts userparam[:email]
    #puts chatroom
    is_new = false
		@user = User.find_by_email(userparam[:email])
    if @user.nil?
      @user = User.new
      @user.email = userparam[:email]
      @user.password = userparam[:password] 
      if @user.save 
        #puts "User has been created"
        is_new = true
        chat = ChatRoom.search_room(chatroom, @user, is_new)
        if chat
          return [@user, chat]
        else
          return [@user, nil]
        end
      end
    else
      #puts "User already exist"
      if @user.password == userparam[:password] 
        #puts "Useremail and password is correct valid user"
        chat = ChatRoom.search_room(chatroom, @user, is_new)
        if chat
          return [@user, chat]
        else
          return [@user, nil]
        end
      else
        #puts "incorrect email and password"
        return [nil, nil]
      end
    end
	end

 end
