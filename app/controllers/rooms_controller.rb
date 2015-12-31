class RoomsController < ApplicationController
  def show
    @message = Message.new
    @chatroom = ChatRoom.find_by_token(params[:id])
    @old_message = @chatroom.messages.all
    @old_upload_files = @chatroom.uploadfiles.all
    @old_user_id = @chatroom.user_chat_rooms.all

        

    @invite = Invite.new
    @uploadfile = Uploadfile.new
  end
end
