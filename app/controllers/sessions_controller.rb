class SessionsController < ApplicationController

	def create
	   @user = User.find_by(username: params[:username])
	   if @user
	      session[:user_id] = @user.id
	      flash[:success] = 'Successfully logged in.'
	      redirect_to users_path
	   else
	   	  flash[:danger] = 'Error logging in.'
	      redirect_to '/login'
	   end
	end
    def destroy
	    session[:user_id] = nil
	    redirect_to root_path, notice: "Logged out!"
    end
end
