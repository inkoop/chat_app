class InvitesController < ApplicationController

  def create
    @invite = Invite.invitepeople(params[:invite][:email],params[:chat_room_id])
#    @chatroom.name name is send through email
    @link = "http://localhost:3000/invites/#{@invite.token}"
    puts @link
    flash[:notice] = "Invitation sent"
    redirect_to room_path  :id => params[:chat_room_token]
  end

  def show
    @valid_invite = Invite.invite_link_is_valid(params[:id])
    if @valid_invite
      render :show
    else
      flash[:notice] = "Link expired"
      redirect_to root_path   
    end
  end

  def set_password
    params[:email]
    params[:password]
    params[:chat_room_id]
    @user = User.find_by_email(params[:email])
    @move_to_chat_room 
    if @user.nil?
      @user = User.new
      @user.email = params[:email]
      @user.password = params[:password] 
      @move_to_chat_room = @user.save
    else
      if @user.password == params[:password]
        @move_to_chat_room = true
      end
    end

    if @move_to_chat_room
      session[:current_user_id] = @user.id
      UserChatRoom.create(user_id: @user.id, chat_room_id: params[:chat_room_id])
      invite = Invite.find_by_token(params[:invite_token])
      invite.update(is_fresh: false)
      chat_room = ChatRoom.find(params[:chat_room_id])
      redirect_to room_path  :id => chat_room.token
    else
      redirect_to root_path   
    end

  end

end
