Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  devise_for :admins, controllers: {
    registrations: 'admins/registrations',
    sessions: 'admins/sessions',
    passwords: 'admins/passwords'
  }

  namespace :admins do

    resources :ingredients, only: [:new, :create, :index, :destroy]
    #   get 'ingredients/new'
    #   get 'ingredients/create'
    #   get 'ingredients/index'
    resources :users, only: [:index, :show, :edit, :update]
    #   get 'users/index'
    #   get 'users/show'
    #   get 'users/edit'
    #   patch 'users/update'
    resources :genres, only: [:index, :create, :edit, :update, :new] do
      collection do
        get :category1
        get :category2
        get :category3
        get :category4
      end
    end
    # get 'genres/index'
    # post 'genres/create'
    # get 'genres/edit'
    # patch 'genres/update'
    resources :recipes
    # get 'recipes/index'
    # get 'recipes/new'
    # post 'recipes/create'
    # patch 'recipes/update'
    # get 'recipes/show'
    # get 'recipes/edit'
    # resources :homes, only: [:top]
    get 'homes/top'
  end

namespace :users do

  resources :users, only: [:show]
  resources :calorie_dentakus, only: [:index, :destroy]
   # get 'calorie_dentakus/show'
  resources :sessions, only: [:new, :create, :destroy]
    # get 'sessions/new'
    # post 'sessions/create'
    # delete 'sessions/destroy'
  resources :homes, only: [] do
    collection do
      get :top
      get :about
    end
  end
    # get 'homes/top'
    # get 'homes/about'
  resources :ingredients, only: [:index]
    resources :my_memo, only: [:show, :destroy]
    resources :recipes, only: [:create, :new, :index, :show] do

      collection do
        get :search
      end
    end

  end
  post '/users/recipes/new', to: "users/recipes#new"
  root to: "users/homes#top"
end
