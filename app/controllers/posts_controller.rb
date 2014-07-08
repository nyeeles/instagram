class PostsController < ApplicationController

	before_action :authenticate_user!, except: [:index]

	def index
		@posts = Post.all
		@post = Post.new
	end

	def create
		@post = Post.create params[:post].permit(:title, :body, :image)
		if @post.save
			redirect_to '/posts'
		else
			flash[:alert] = 'Please attach an image'
			redirect_to '/posts'
		end
	end
end
