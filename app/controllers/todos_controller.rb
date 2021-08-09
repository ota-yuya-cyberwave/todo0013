class TodosController < ApplicationController
    before_action :authenticate_user!
    before_action :chk_user_id

    def new
      @categories = Category.where(user_id: current_user.id).map { |c| [c.title, c.id] }
      @todo = Todo.new(user_id: current_user.id)
    end
  
    def create
      category = Category.find_by(user_id: current_user.id, id: params[:category_id])
      @todo = category.todos.build(todo_params)
      @todo.user_id = current_user.id
      redirect_to category
    end
  
    def show
      @todo = Todo.find_by(user_id: current_user.id, id: params[:id])
    end
  
    def edit
      @categories = Category.where(user_id: current_user.id).map { |c| [c.title, c.id] }
      @todo = Todo.find_by(user_id: current_user.id, id: params[:id])
    end
  
    def update
      @todo = Todo.find_by(user_id: current_user.id, id: params[:id])
      if @todo.update(todo_params)
        redirect_to @todo.category
      else
        flash[:start_at] = @todo.errors[:start_at]
        @categories = Category.where(user_id: current_user.id).map { |c| [c.title, c.id] }
        render "edit"
      end
    end
  
    def destroy
      @todo = Todo.find_by(user_id: current_user.id, id: params[:id])
      @categorie = @todo.category
      @todo.destroy
      redirect_to @categorie
    end

    private
    def todo_params
      params.require(:todo).permit(:title, :user_id, :category_id, :content, :start_at, :completed_at)
    end

    def chk_user_id
      begin
        if params[:id] && Todo.find(params[:id]).user_id != current_user.id then
          render 'errors/404', status: :not_found
        end
      rescue
        render 'errors/404', status: :not_found
      end
    end
  end