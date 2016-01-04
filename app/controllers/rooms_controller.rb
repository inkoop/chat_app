class RoomsController < ApplicationController
  def show
    if session[:current_user_id]
      @message = Message.new
      @chatroom = ChatRoom.find_by_token(params[:id])
      @old_message = @chatroom.messages.all
      @old_upload_files = @chatroom.uploadfiles.all
      @user_emails = @chatroom.users.all
      
      @invite = Invite.new
      @uploadfile = Uploadfile.new
    else
      redirect_to root_path
    end
      

  end
end


