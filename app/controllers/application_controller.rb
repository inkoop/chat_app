class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :fetch_user_chat_rooms

  private 

  def fetch_user_chat_rooms
    if session[:current_user_id]
      user = User.find(session[:current_user_id])
      @user_chat_rooms = user.chat_rooms.all
    end
  end

end
