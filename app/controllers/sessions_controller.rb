class SessionsController < ApplicationController
   def new
   end

   def create
   	user = User.find_by(email: params[:session][:email].downcase)
   	if user && user.authenticate(params[:session][:password])
   		#user is authenticated and can sign inr
   		sign_in user
   		redirect_to user

   	else
   		#creaet error message as to why the user can't sign in
   		flash.now[:error] = "Invalid email/password combination" #eh almost
   		render 'new'
   	end
   end

   def destroy
      sign_out 
      redirect_to root_url #this is to go to the home page
   end

end
