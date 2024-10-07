class TasksController < ApplicationController
    def index
      @incomplete_tasks = Task.where(status: 'incomplete')
      @complete_tasks = Task.where(status: 'complete')
    end
  
    def create
      task = Task.new(description: params[:task][:description], status: 'incomplete')
      if task.save
        redirect_to tasks_path, notice: 'Task created successfully!'
      else
        render :index
      end
    end
  
    def complete
      task = Task.find(params[:id])
      task.update(status: 'complete')
      redirect_to tasks_path, notice: 'Task marked as complete!'
    end
  
    def show
      redirect_to tasks_path
    end
  
    def destroy
      task = Task.find(params[:id])
      task.destroy
      redirect_to tasks_path, notice: 'Task was successfully deleted.'
    end
  
    def clear_complete_tasks
      Task.where(status: 'complete').destroy_all
      redirect_to tasks_path, notice: 'All complete tasks cleared!'
    end
  end