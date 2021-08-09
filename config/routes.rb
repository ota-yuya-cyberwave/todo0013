Rails.application.routes.draw do
  root "categories#index"

  resources :categories do
    resources :todos, only: [:show, :update, :destroy, :create, :edit]
  end

  devise_for :users
end
