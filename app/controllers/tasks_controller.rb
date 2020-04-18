class TasksController < ApplicationController
  before_action :set_tasks, only: %i[show edit destroy update]
  before_action :authorized

  def index
    @tasks = current_user.tasks.order('created_at DESC')
    @total_task = current_user.tasks.sum(:hours)
  end

  def external
    @tasks = Task.not_in_any_group
    @total_task = @tasks.sum(:hours)
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      flash[:success] = 'Task successfully created.'
      redirect_to tasks_path
    else
      flash.now[:success] = "Task wasn't created."
      render :new
    end
  end

  def edit; end

  def update
    if @task.update(task_params)
      flash[:success] = 'Task successfully updated.'
      redirect_to tasks_path
    else
      flash.now[:danger] = "Task wasn't updated."
      render :edit
    end
  end

  def show; end

  def destroy
    @task.destroy
    redirect_to tasks_path, danger: 'Task successfully deleted.'
  end

  private

  def task_params
    params.require(:task).permit(:name, :hours, group_ids: [])
  end

  def set_tasks
    @task = Task.find(params[:id])
  end
end
