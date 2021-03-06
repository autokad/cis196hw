class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
	end
	
	def index
		@users = User.all
	end
	
	def edit
		@user = User.find(params[:id])
	end
	
	def update
		#@post = Post.find(params[:id])
		@user  = User.find(params[:id])
		if (@user.update_attributes(params[:user]))
			redirect_to @user
		else
			render 'edit'
		end
	end
	
	def destroy
		#@post = current_user.posts.find(params[:id])
		#@post.destroy
		@user = User.find(params[:id])
		@user.posts.destroy_all
		@user.destroy
		redirect_to users_path
	end
	
end
