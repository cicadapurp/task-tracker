class TasksController < ApplicationController
before_action :set_board
before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = @board.tasks
  end

  def show
  end

  def new
    @task = @board.tasks.new
    render :new
  end
  def create
    @task = @board.tasks.new(task_params)
    if @task.save
      redirect_to [@board, @task]
    else
      render :new
    end
  end
  def edit
    render :edit

  end
  def update
    if @task.update(task_params)
      redirect_to board_task_path(@board, @task)
    else
      render :edit
    end
  end
  def destroy
    @task.destroy
    redirect_to board_tasks_path(@board)
  end
  private
  def set_board
    @board = Board.find(params[:board_id])
  end
  def set_task
    @task = @board.tasks.find(params[:id])
  end
  def task_params
    params.require(:task).permit(:name, :dept)
  end
end
