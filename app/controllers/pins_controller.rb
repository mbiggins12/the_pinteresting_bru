class PinsController < ApplicationController
	def index
		@user = current_user
		@pins = Pin.all
	end

	def create
		@user = current_user
		@pin = Pin.new(pin_params)
		if @pin.save
  		redirect_to pins_path
  	else
  		render :new
  	end	
	end

	def new
		@user = current_user
		@pin = Pin.new
	end

	def show
		@pin = Pin.find(params[:id]) 
	end

	def update
		@pin = Pin.find(params[:id])
  	if @pin.update(pin_params)
  		redirect_to pin_path
  	else
  		render :edit
  	end
	end

	def edit
		@pin = Pin.find(params[:id])
	end


	private

	def pin_params
		params.require(:pin).permit(:title, :description, :image)
	end

end
