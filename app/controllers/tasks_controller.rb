class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params.require(:task).permit(:title, :start_date, :end_date, :is_all_day, :memo))
      if @task.save
        flash[:notice] = "予定を作成しました"
        redirect_to :tasks
      else
        flash.now[:alert] = "予定の作成に失敗しました"
        render "new"
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
    if @task.update(params.require(:task).permit(:title, :start_date, :end_date, :is_all_day, :memo))
      flash[:notice] = "予定(#{@task.id})の情報を更新しました"
      redirect_to :tasks
    else
      flash.now[:alert] = "予定の編集に失敗しました"
      render "edit"
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "予定を削除しました"
    redirect_to :tasks
  end
end
