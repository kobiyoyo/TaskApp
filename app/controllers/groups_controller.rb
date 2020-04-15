class GroupsController < ApplicationController
  before_action :set_groups,only: [:show,:edit,:destroy,:update]
  before_action :authorized

  def index
  	@groups = current_user.groups
  end

  def new
  	@group = Group.new
  end

  def create
  	@group = current_user.groups.new(group_params)
  	if @group.save
  		flash[:success] = 'Group successfully created.'
  		redirect_to groups_path
  	else
  		flash.now[:danger] = "Group wasn't created."
  		render :new
  	end
  end

  def edit

  end

  def update
  	if @group.update(group_params)
  		flash[:success] = 'Group successfully updated.'
  		redirect_to groups_path
  	else
  		flash.now[:danger] = "Group wasn't updated."
  		render :edit
  	end
  end

  def show
  end

  def destroy
  	@group.destroy
  	redirect_to groups_path,danger: 'Group successfully deleted.'
  end

  private
  def group_params
  	params.require(:group).permit(:icon,:name)
  end
  def set_groups
  	@group = Group.find(params[:id])
  end
end
