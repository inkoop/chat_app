class MarkprivateController < ApplicationController
  
  def privateandpublic()
    ChatRoom.changeprivacy(params[:chat_room_id], params[:is_public])
    flash[:notice] = "Room privacy changed"
    redirect_to room_path  :id => params[:chat_room_token]
  end

end
