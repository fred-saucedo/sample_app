class RelationshipsController < ApplicationController
	before_action :signed_in_user 

	def create
		#find user to follow
		@user = User.find(params[:relationship][:followed_id])
		#make the current user follow the requested user
		current_user.follow!(@user)

		#go back to the user's page
		redirect_to @user
	end

	def destroy
		#find the user the is being followed
		#have to use the relationship model to find the followed_id of the 
		#user thaat is followed
		@user = Relationship.find(params[:id]).followed

		#destory that relationship
		current_user.unfollow!(@user)

		#go back to your page
		redirect_to @user
	end

end 