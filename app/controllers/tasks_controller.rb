class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find_by(id: params[:id])
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
    @task = Task.find_by(id: params[:id])
  end

  def update
    @task = Task.find_by(id: params[:id])
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
    @task = Task.find_by(id: params[:id])
    @task.destroy

    redirect_to tasks_url, notice: "Task deleted."
  end
end
