class LoginController < ApplicationController

  def index
    @chatroom_list = ChatRoom.pluck(:name, :name)
    @user = User.new
  end

end
