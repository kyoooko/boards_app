class BoardsController < ApplicationController
  before_action :set_target_board, only: %i[show edit update destroy]

  def index
    @boards=Board.page(params[:page])
  end

  def new
    @board=Board.new
    # binding.pry
  end

  def create
    board = Board.new(board_params)
    if board.save
      flash[:notice] = "「#{board.title}」の掲示板を作成しました"
      # 下記はredirect_to board_path(@board.id)と同じ
      redirect_to board
    else
      redirect_to :back, flash: {
        board: board,
        error_messages: board.errors.full_messages
      }
    end
  end

  def show
    # @board = Board.find(params[:id])
  end

  def edit
    # @board = Board.find(params[:id])
  end

  def update
    # board = Board.find(params[:id])
    # 多分 before_actionで揃えるために＠つけた
    @board.update(@board_params)
    redirect_to board
  end

  def destroy
  #   board = Board.find(params[:id])
    @board.delete

    # 一覧画面へ
    redirect_to boards_path, flash: { notice: "「#{@board.title}」の掲示板が削除されました" }
  end

  private
  def board_params
    params.require(:board).permit(:name, :title, :body)
  end

  def set_target_board
    @board=Board.find(params[:id])
  end
end