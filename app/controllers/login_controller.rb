class LoginController < ApplicationController
	def index
    @temp = "hello yogesh"
	end

  def add
    User.create(:email => params[:userEmail], : => params[:userPassword])
  end
end
