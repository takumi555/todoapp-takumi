class TasksController < ApplicationController

  def new
    board = Board.find(params[:board_id])
    @task = board.tasks.build(user_id: current_user.id)
  end

  def create
    board = Board.find(params[:board_id])
    @task = board.tasks.build(task_params.merge!(user_id: current_user.id))
    if @task.save!
      redirect_to root_path, notice: 'タスクを作成しました'
    else
      flash.now[:error] = 'タスクを作成できませんでした'
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to root_path, notice: '更新しました'
    else
      flash.now[:error] = '更新に失敗しました'
      render :edit
    end

  end

  def destroy
    task = Task.find(params[:id])
    task.destroy!
    redirect_to root_path, notice: '削除いたしました'
  end

  private 
    def task_params
      params.require(:task).permit(:title, :content, :deadline, :eyecatch)
    end

end