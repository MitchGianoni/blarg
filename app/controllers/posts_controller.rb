class PostsController < ApplicationController
	def index
		@posts = Post.page(params[:page]).per(5)
	end

	def new
		render :new
	end

	def create
		new_post = Post.create(title: params["title"],
								content: params["content"])

		redirect_to :root
	end

	def edit
		render :edit
	end

	def update
		#this_post = Post.find(params[:id])
		#this_post.update( title: params["title"], content: params["content"])

		#redirect_to :root
		post = Post.find(params["id"])
		post.update(title: params["title"], content: params["content"])
	end

	def show
		@post = Post.find(params[:id])
		render :show #locals: { post: @post }
		#more common to see instance variables than locals in
		#controller methods
		#totally legal to do @post = Post.find(params["id"])
	end

end