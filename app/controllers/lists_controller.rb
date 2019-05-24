class ListsController < ApplicationController
  before_action :set_task
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  def index
    @lists = @task.lists
  
  end

  def show
  end

  def new
    @list = @task.lists.new
    render :new
  end
  def create
    @list = @task.lists.new(list_params)
    if @list.save
      redirect_to task_list_path(@task.id, @list.id)
    else
      render :new
    end
  end
  def update
    if @list.update(list_params)
      redirect_to task_list_path(@task, @list)
    else
      render :edit
    end
  end
  def destroy
    @list.destroy
    redirect_to task_lists_path(@task)
  end
  def set_task
    @task = Task.find(params[:task_id])

  end
  def set_list
    @list = @task.lists.find(params[:id])
  end
  def list_params
    params.require(:list).permit(:name, :note, :state)
  end
end
