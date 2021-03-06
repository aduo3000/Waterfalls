class WaterfallsController < ApplicationController
  	
  	def index
  		@q = Waterfall.ransack(params[:q])
    	@waterfalls = @q.result(distinct: true).page(params[:page]).per(15).order('title ASC')
  	end  	
  	
  	def show
   	@waterfall = Waterfall.find(params[:id])
  	end
	
	def new
		@waterfall = Waterfall.new
	end
	
	def edit
  		@waterfall = Waterfall.find(params[:id])
	end
		
	def create
		@waterfall = Waterfall.new(waterfall_params)
 
  		if @waterfall.save
  			flash[:notice] = "Saved"
  			redirect_to @waterfall
  		else
  			render 'new'
  		end
  	end
	
	def update
  		@waterfall = Waterfall.find(params[:id])
 
  		if @waterfall.update(waterfall_params)	
    		redirect_to @waterfall
  		else
    		render 'edit'
  		end
	end  	

  	def destroy
  		@waterfall = Waterfall.find(params[:id])
  		@waterfall.destroy
 
  		redirect_to waterfalls_path
	end
  	private
  		def waterfall_params
    		params.require(:waterfall).permit(:title, :text, :height, :width, :drops, :tallestDrop, :form, :watershed, :stream, :location, :state, :visit, :avatar, :imageName, :index)
  		end
end


