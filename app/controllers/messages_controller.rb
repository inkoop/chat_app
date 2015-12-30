class MessagesController < ApplicationController
	def create
    message = Message.newmessage(params[:message][:content], session[:current_user_id], params[:chat_room_id]) 
    
    PrivatePub.publish_to "/rooms/"+params[:chat_room_token], :message_content => message.content
    #if message
      #flash[:notice] = "message posted"
      #redirect_to room_path  :id => params[:chat_room_token]
      #publish new message
      
    #end
	end
end
