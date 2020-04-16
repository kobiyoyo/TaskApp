class TasksController < ApplicationController
  before_action :set_tasks,only: [:show,:edit,:destroy,:update]
  before_action :authorized

  def index
  	@tasks = current_user.tasks
  end

  def new
  	@task = Task.new
  end

  def create
  	@task = current_user.tasks.new(task_params)
  	if @task.save
  		flash[:success] = 'Tasks successfully created.'
  		redirect_to tasks_path
  	else
  		flash.now[:success] = "Tasks wasn't created."
  		render :new
  	end
  end

  def edit

  end

  def update
  	if @task.update(task_params)
  		flash[:success] = 'Tasks successfully updated.'
  		redirect_to tasks_path
  	else
  		flash.now[:danger] = "Tasks wasn't updated."
  		render :edit
  	end
  end



  def show
  end

  def destroy
  	@task.destroy
  	redirect_to tasks_path,danger: 'Tasks successfully deleted.'
  end

  private
  def task_params
    params.require(:task).permit(:name,:hours, group_ids:[])
  end
  def set_tasks
  	@task = Task.find(params[:id])
  end
end