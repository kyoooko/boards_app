class BoardsController < ApplicationController
  before_action :set_target_board, only: %i[show edit update destroy]

  def index
    @boards=Board.all
  end
  def new
    @board=Board.new
    # binding.pry
  end
  def create
    board=Board.create(board_params)
    # 下記はredirect_to board_path(@board.id)と同じ
    redirect_to board
    # binding.pry
  end

  def show
    # @board = Board.find(params[:id])
  end

  def edit
    # @board = Board.find(params[:id])
  end

  def update
    # board = Board.find(params[:id])
    board.update(board_params)
    redirect_to board
  end

  def destroy
  #   board = Board.find(params[:id])
    board.delete

    # 一覧画面へ
    redirect_to boatds_path
  end

  private
  def board_params
    params.require(:board).permit(:name, :title, :body)
  end

  def set_target_board
    @board=Board.find(params[:id])
  end
end