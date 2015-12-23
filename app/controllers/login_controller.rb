class LoginController < ApplicationController
  def index
    @user = User.new
  end

  def check
    user_details = User.find_by_email(params[:userEmail])
    #User.mymethod

    if user_details.nil? # if true no data in user
      @user = User.new
      @user.email = params[:userEmail]
      @user.password = params[:userPassword] 
      if @user.save 
        searchroom
      end

    else
      if user_details.password == params[:userPassword] 
        #redirect_to login_check_path
        searchroom
        #render :check
      else
        render :index
        #render plain: "user email and password wrong"
      end
    end
  end


  private
    def searchroom
      chatroom_details = ChatRoom.find_by_name(params[:chatroomName])
      if chatroom_details.nil? #if the chatroom is not available 
        if createroom
          #render :chat
          #render plain: "user is enter into a searched and newly created chat room"
        end
      else                                    #if the chatroom is available 
        if chatroom_details.is_public == true #if the search room name is public
          #render plain: "user is enter into a searched and existing chat room"
        else                                  #if the search room name is not public(private)
          #check the user details 
          #render plain: "it is private chat room"
        end
      end
    end

    def createroom 
      @chatroom = ChatRoom.new
      @chatroom.name = params[:chatroomName]
      @chatroom.is_public = true
      success = @chatroom.save
      return success
    end

end
