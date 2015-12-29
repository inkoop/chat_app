class MessagesController < ApplicationController
	def create
    message = Message.newmessage(params[:message][:content], session[:current_user_id], params[:chat_room_id]) 
    if 
      flash[:notice] = "message posted"
      #redirect_to room_path  :id => params[:chat_room_token]

      #publish new message
      PrivatePub.publish_to "/rooms/"+params[:chat_room_token], :message_content => message.content
    end
	end
end
