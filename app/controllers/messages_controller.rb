class MessagesController < ApplicationController
	def create
    if Message.newmessage(params[:message][:content], session[:current_user_id], params[:chat_room_id]) 
      flash[:notice] = "message posted"
      redirect_to room_path  :id => params[:chat_room_id]
    end
	end
end
