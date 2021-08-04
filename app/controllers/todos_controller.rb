class TodosController < ApplicationController
    def index
      @todos = Todo.all
    end
  
    def new
      @todo = Todo.new
    end
  
    def create
      @todo = Todo.new(todo_params)
      if @todo.save
        redirect_to action: :index
      else
        render "new"
      end
    end
  
    def edit
    end
  
    private
    def todo_params
      params.require(:todo).permit(:title, :user_id, :category_id, :content, :start_at, :completed_at)
    end
  end