class PostsController < ApplicationController

	def index
		@posts = Post.all
		@post = Post.new
	end

	def create
		@post = Post.create params[:post].permit(:title, :body, :image)
		redirect_to '/posts'
	end
end
