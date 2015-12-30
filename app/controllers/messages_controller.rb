class MessagesController < ApplicationController
	def create
    message = Message.newmessage(params[:message][:content], session[:current_user_id], params[:chat_room_id]) 
    user_name = message.user.email
    user_id = message.user.id
    if message
      #publish new message
      PrivatePub.publish_to "/rooms/"+params[:chat_room_token], :message_content => message.content, :time => message.time, :from => user_name, :user_id => user_id
    end
	end
end
