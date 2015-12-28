class RoomsController < ApplicationController
  def show
    @message = Message.new
    @chatroom = ChatRoom.find(params[:id])
    @old_message = @chatroom.messages.all
  end
end
