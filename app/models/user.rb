class User < ActiveRecord::Base
	has_many :user_chat_rooms
	has_many :chat_rooms, :through => :user_chat_rooms
	has_many :messages
	has_many :uploadfiles

	def self.authendicateuser(userparam, chatroom)
    #puts userparam[:email]
    #puts chatroom
		user_details = User.find_by_email(userparam[:email])
    if user_details.nil?
      @user = User.new
      @user.email = userparam[:email]
      @user.password = userparam[:password] 
      if @user.save 
        puts "User has been created"
        chat = ChatRoom.search_room(chatroom, @user)
        if chat
          return [@user, chat]
        else
          return [@user, nil]
        end
      end
    else
      puts "User already exist"
      if user_details.password == userparam[:password] 
        puts "Useremail and password is correct valid user"
        chat = ChatRoom.search_room(chatroom, @user)
        if chat
          return [@user, chat]
        else
          return [@user, nil]
        end
      else
        puts "incorrect email and password"
        #redirect to the index page
        return [nil, nil]
      end
    end
	end

 end
