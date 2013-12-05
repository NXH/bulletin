class TasksController < ApplicationController

  before_action :authenticate_account!
  before_action :set_task, :only => [:show, :edit, :update, :destroy]
  before_action :account_must_own_task, :only => [:show, :edit, :update, :destroy]

  def set_task
    @task = Task.find_by(id: params[:id])
  end

  def account_must_own_task
    unless @task.account_id == current_account.id
      redirect_to root_url, :alert => "You are not authorized to do that."
    end
  end

  def index
    if params[:category]
      @tasks = current_account.tasks.where(:category_id => params[:category])
    elsif params[:person1]
      @tasks = current_account.tasks.where(:person1 => true)
    elsif params[:person2]
      @tasks = current_account.tasks.where(:person2 => true)
    else
      @tasks = current_account.tasks.all
    end
  end

  def show

  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new
    @task.title = params[:title]
    @task.due_date = params[:due_date]
    @task.account_id = current_account.id
    @task.description = params[:description]
    @task.category_id = params[:category_id]
    @task.complete = params[:complete]
    @task.person1 = params[:person1]
    @task.person2 = params[:person2]

    if @task.save
      redirect_to tasks_url, notice: "Task created successfully."
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    @task.title = params[:title]
    @task.due_date = params[:due_date]
    @task.account_id = current_account.id
    @task.description = params[:description]
    @task.category_id = params[:category_id]
    @task.complete = params[:complete]
    @task.person1 = params[:person1]
    @task.person2 = params[:person2]

    if @task.save
      redirect_to tasks_url, notice: "Task updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @task.destroy

    redirect_to tasks_url, notice: "Task deleted."
  end
end
