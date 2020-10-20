class BoardsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]

  def index
    @boards = Board.all
  end

  def new
    @board = current_user.boards.build
  end

  def show
    @board = Board.find(params[:id])
    @tasks = @board.tasks
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save!
      redirect_to root_path, notice: '登録できました'
    else
      flash.now[:error] = '登録できませんでした'
      render :new
    end
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])
    if @board.update(board_params)
      redirect_to root_path, notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    board = Board.find(params[:id])
    board.destroy!
    redirect_to root_path, notice: '削除しました'
  end

  private
  def board_params
    params.require(:board).permit(:title, :content, :tasks, :eyecatch)
  end

  def set_board
    @board = Board.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :content, :deadline, :eyecatch)
  end

end