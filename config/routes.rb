Rails.application.routes.draw do
  devise_for :users
  devise_for :admins

  namespace :admins do
  resources :ingredients, only: [:new, :create]
  #   get 'ingredients/new'
  #   get 'ingredients/create'
  end

  namespace :admins do
  resources :users, only: [:index, :show,:edit, :update]
  #   get 'users/index'
  #   get 'users/show'
  #   get 'users/edit'
  #   patch 'users/update'
  end

  namespace :admins do
  resources :genres, only: [:index, :create,:edit, :update]
    # get 'genres/index'
    # post 'genres/create'
    # get 'genres/edit'
    # patch 'genres/update'
  end

  namespace :admins do
  resources :recipes, only: [:index, :create, :edit, :update, :new, :show]
    # get 'recipes/index'
    # get 'recipes/new'
    # post 'recipes/create'
    # patch 'recipes/update'
    # get 'recipes/show'
    # get 'recipes/edit'
  end

  namespace :admins do
  resources :homes, only: [:top]
    # get 'homes/top'
  end

  namespace :users do
  resources :calorie_dentakus, only: [:show]
   # get 'calorie_dentakus/show'
  end

  namespace :users do
  resources :sessions, only: [:new, :create, :destroy]
    # get 'sessions/new'
    # post 'sessions/create'
    # delete 'sessions/destroy'
  end

  namespace :users do
  resources :homes, only: [:top, :about]
    # get 'homes/top'
    # get 'homes/about'
  end

  namespace :users do
  resources :ingredients, only: [:create, :new]
    # get 'ingredients/create'
    # get 'ingredients/new'
  end

  namespace :users do
  resources :recipes, only: [:create, :new, :index, :show]
    # get 'recipes/index'
    # post 'recipes/create'
    # get 'recipes/new'
    # get 'recipes/show'
  end

  root to: "users/homes#top"
end
