class SessionsController < ApplicationController
	def new
		flash[:notice] = 'Welcome!'
    flash[:alert] = 'My birthday is soon.'
    flash[:notice] = 'Welcome!'
	end

	def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user 
      # Sign the user in and redirect to the user's show page.
      sign_in user
      redirect_to user
    else
       flash.now[:error] = 'Invalid email' # Not quite right!
      render 'new'

    end
  end

	def destroy
        sign_out
         flash.now[:alert] = 'you have signed out'
    redirect_to root_url
    flash[:alert] = 'My birthday is soon.'
	end
end
