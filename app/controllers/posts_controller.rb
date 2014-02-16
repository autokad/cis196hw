class PostsController < ApplicationController
	def new
		@post= current_user.posts.new
		#@post = Post.new
	end
	
	def create
		#@post = Post.new(params[:post])
		@post = current_user.posts.new(params[:post])
		
		@user = User.find(@post.user_id)
		@user.hours=@post.hours
		@user.posts.all.each do |post|
		  @user.hours=@user.hours+post.hours
		end

		if @post.save
			@user.save
			redirect_to @post
			
		else
			render 'new'
		end
	end
	
 	def show
		@post = Post.find(params[:id])
	end
	
	def index
		@posts = Post.all
	end
	
	def edit
		#@post = current_user.posts.find(params[:id])
		@post = Post.find(params[:id])
	end
	
	def update
		@post = Post.find(params[:id])
		@user = User.find(@post.user_id)
		@user.hours=@post.hours
		@user.posts.all.each do |post|
		  @user.hours=@user.hours+post.hours
		end
		@user.save
		
		if (@post.update_attributes(params[:post]))
			redirect_to @post
		else
			render 'edit'
		end
	end
	
	def destroy
		@post = Post.find(params[:id])
		@user = User.find(@post.user_id)
		@post.destroy
		@user.hours=0
		@user.posts.all.each do |post|
		  @user.hours=@user.hours+post.hours
		end
		@user.save
		redirect_to posts_path
	end
	
	private
	def post_params
		params.require(:post).permit(:title, :text)
	end
end
