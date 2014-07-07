class PostsController < ApplicationController

	def index
		@posts = Post.all
		@post = Post.new
	end

	def create
		@post = Post.create params[:post].permit(:title, :body)
		redirect_to '/posts'
	end
end
