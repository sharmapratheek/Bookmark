class SessionsController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.find_by(email: params[:session][:email].downcase)
		if @user && @user.authenticate(params[:session][:password])
			session[:user_id] = @user.id
	+		flash[:success] = "You have logged in successfully"
			redirect_to @user
		else
			flash.now[:danger] = "There is something wrong with the login information "
			render 	'new'
		end
	end

	def destroy
		session[:chef_id]= nil
		flash[:session] = "you have logged out"
		redirect_to root_path 
		
	end


end