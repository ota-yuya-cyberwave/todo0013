class CategoriesController < ApplicationController
    before_action :authenticate_user!

    def index
      @categories = Category.all
    end
  
    def new
      @category = Category.new
    end
  
    def create
      @category = Category.new(category_params)
      if @category.save
        redirect_to action: :index
      else
        render "new"
      end
    end
  
    def edit
    end
  
    private
    def category_params
      params.require(:category).permit(:title)
    end
  end