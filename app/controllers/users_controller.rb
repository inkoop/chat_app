class UsersController < ApplicationController

	def create
		@user, @room = User.authendicateuser(params[:user], params[:chatroomname])
    if !@user.nil? and !@room.nil? 
      #render :text => "user is valid"
      flash[:notice] = "user is valid"
      session[:current_user_id] = @user.id
      session[:current_room_id] = @room.id
      redirect_to room_path  :id => @room.token    #rooms_path or rooms_url

    elsif !@user.nil? and @room.nil? 
      #render :text => "user is not access to private room"
      flash[:notice] = "user is not acccess to private room"
      redirect_to root_path
    else
      #render :text => "username and password incorrect"
      flash[:notice] = "username and password incorrect"
      redirect_to root_path
    end
  end

  def show
    @user = User.find(params[:id])
  end	

end
