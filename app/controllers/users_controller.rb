class UsersController < ApplicationController

	def create
		user, room = User.authendicateuser(params[:user], params[:chatroomname])
    
	end	

end


	
