module SessionsHelper

   def sign_in(user)
   	remember_token = User.new_remember_token
   	cookies.permanent[:remember_token] = remember_token
   	user.update_attribute(:remember_token, User.digest(remember_token))
   	self.current_user = user 
   end

   def current_user=(user)
   	@current_user = user
   end

   def current_user
   	remember_token = User.digest(cookies[:remember_token])
   	@current_user ||= User.find_by(remember_token: remember_token)
   end 

   def signed_in?
   	!current_user.nil?
   end

   def sign_out 
      current_user.update_attribute(:remember_token, User.digest(User.new_remember_token))
      #now we must delete the currents user's cookie

      cookies.delete(:remember_token)
      #now destroy the current user object
      self.current_user = nil
   end
   


end
