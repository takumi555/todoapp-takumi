class CommentsController < ApplicationController

  
  def new
    @task = Task.find(params[:task_id])
    @comment = @task.comments.build
  end
  
  def create
    task = Task.find(params[:task_id])
    @comment = task.comments.build(comment_params.merge!(user_id: current_user.id))
    if @comment.save!
      redirect_to root_path, notice: 'コメントを作成しました'
    else
      flash.now[:error] = 'コメントを作成できませんでした'
      render :new
    end

  end

  private 
    def comment_params
      params.require(:comment).permit(:content)
    end

end