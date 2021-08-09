class CategoriesController < ApplicationController
    before_action :authenticate_user!
    before_action :chk_user_id

    def index
      @categories = Category.where(user_id: current_user.id)
    end
  
    def new
      @category = Category.new(user_id: current_user.id)
    end
  
    def create
      @category = Category.new(category_params)
      @category.user_id = current_user.id
      if @category.save
        redirect_to action: :index
      else
        render "new"
      end
    end
  
    def show
      @category = Category.find_by(user_id: current_user.id, id: params[:id])
      @todos = Todo.where(user_id: current_user.id, category_id: params[:id])
      @todo = Todo.new(user_id: current_user.id, category_id: params[:id])
    end

    def edit
      @category = Category.find_by(user_id: current_user.id, id: params[:id])
    end
  
    def update
      @category = Category.find_by(user_id: current_user.id, id: params[:id])
      if @category.update(category_params)
        redirect_to @category
      else
        render "edit"
      end
    end
  
    def destroy
      Category.find_by(user_id: current_user.id, id: params[:id]).destroy
      redirect_to "/categories"
    end
  
    private
    def category_params
      params.require(:category).permit(:title)
    end

    def chk_user_id
      begin
        if params[:id] && Category.find(params[:id]).user_id != current_user.id then
          render 'errors/404', status: :not_found
        end
      rescue
        render 'errors/404', status: :not_found
      end
    end
  end