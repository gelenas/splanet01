class SessionsController < ApplicationController
	def new

	end

	def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user 
      # Sign the user in and redirect to the user's show page.
      sign_in user
      redirect_to user
    else
      flash.now[:error] = 'Invalid email' 
      render 'new'

    end
  end

	def destroy
        sign_out
       flash[:success] = "You have signed out" 
    redirect_to root_url
  
	end
end
