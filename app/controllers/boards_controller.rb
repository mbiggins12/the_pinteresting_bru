class BoardsController < ApplicationController
	def index
		@user = current_user
  	@boards = Board.order(:name)
	end

	def create
		@user = current_user
		@board = Board.new(board_params)
		@board.user = @user
		if @board.save
  		redirect_to user_boards_path(@user)
  	else
  		render :new
  	end
	end

	def new
		@user = current_user
		@board = Board.new
	end

	def show
		@user = current_user
		@board = Board.find(params[:id])
		@board.user = @user
		# @pin.board = 
	end

	def update
		@board = Board.find(params[:id])
  	if @board.update(board_params)
  		redirect_to board_path
  	else
  		render :edit
  	end
	end

	def edit
		@board = Board.find(params[:id])
	end

	def destroy
		@user = current_user
		@board = Board.find(params[:id])
		@board.destroy
		redirect_to boards_path
	end

	private

	def board_params
		params.require(:board).permit(:name, :description, :private, :user_id)
	end
end
