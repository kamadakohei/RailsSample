class TasksController < ApplicationController

  before_action:set_task, only:[:show, :edit, :update, :destroy]
  before_action:redirect_to_signin

  def index
    @tasks = Task.all
    @tasks = @tasks.where(name: params[:name]) if params[:name].present?
    @tasks = @tasks.where(content: params[:content]) if params[:content].present?
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = "タスク#{task_params[:name]}を登録しました"
      redirect_to tasks_path
    else
      flash.now[:alert] = "登録に失敗しました"
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:notice] = "タスクを1件更新しました"
      redirect_to task_path(task_params)
    else
      flash[:alert] = "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @task.destroy
    flash[:notice] = "削除しました"
    redirect_to tasks_path
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end
  
  private
  def redirect_to_signin
    redirect_to signin_path if session[:user_id].blank?
  end

  private
  def task_params
    task_params = params.require(:task).permit(:name, :content)
  end
end