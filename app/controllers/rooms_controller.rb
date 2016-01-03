class RoomsController < ApplicationController
  def show
    @message = Message.new
    @chatroom = ChatRoom.find_by_token(params[:id])
    @old_message = @chatroom.messages.all
    @old_upload_files = @chatroom.uploadfiles.all
    user_ids = @chatroom.user_chat_rooms.all

    user_details = []
    user_ids.each do |u|
      user_details.push(u.user_id)
    end

    @user_emails = []
    user_details.each do |e|
      @user_emails.push(User.find(e))
    end

    @invite = Invite.new
    @uploadfile = Uploadfile.new
  end
end


