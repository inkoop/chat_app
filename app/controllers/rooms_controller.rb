class RoomsController < ApplicationController
  def show
    @message = Message.new
    @chatroom = ChatRoom.find_by_token(params[:id])
    @old_message = @chatroom.messages.all
  end
end
