class PostsController < ApplicationController

	def index
		@q = Post.ransack(params[:q])
    	@posts = @q.result(distinct: true).page(params[:page]).per(15).order('date DESC')
	end
	
	def show
		@post = Post.find(params[:id]) 	
	end

	def new
		@post = Post.new
  	end
	
  	def edit
		@post = Post.find(params[:id])  	
  	end
	
	def create
		@post = Post.new(post_params)
 
  		if @post.save
  			flash[:notice] = "Saved"
  			redirect_to @post
  		else
  			render 'new'
  		end
  	end

	def update
  		@post = Post.find(params[:id])
 
  		if @post.update(post_params)	
    		redirect_to @post
  		else
    		render 'edit'
  		end	
	end
	
	def destroy
	  	@post = Post.find(params[:id])
  		@post.destroy
  		redirect_to posts_path
	end


  	private
  		def post_params
    		params.require(:post).permit(:title, :text, :date)
  		end

end
