class UploadfilesController < ApplicationController
  def create
    @uplaod = Uploadfile.uploadattachment(params[:user_id] ,params[:chat_room_id], params[:uploadfile][:attachment])
    #chat room tooken
    flash[:notice] = "File Uploaded"
    redirect_to room_path  :id => params[:chat_room_token]
  end
end
