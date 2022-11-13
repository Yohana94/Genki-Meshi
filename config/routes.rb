Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
    passwords: "users/passwords"
  }

  devise_for :admins, controllers: {
    registrations: "admins/registrations",
    sessions: "admins/sessions",
    passwords: "admins/passwords"
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
    resources :genres, only: [:index, :create, :edit, :update, :new]
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
    get "homes/top"

    post 'recipes/:id/post_comments', to: 'post_comments#create', as: :post_comments
    delete 'recipes/:id/post_comments/:post_comments_id', to: 'post_comments#destroy', as: :destroy_post_comments

  end

  namespace :users do
    post 'recipes/:id/favorites', to: 'favorites#create', as: :favorites
    delete 'recipes/:id/favorites', to: 'favorites#destroy', as: :destroy_favorites
    resources :users, only: [:show, :edit, :update, :create]
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
    resources :mymemos_ingredients, only: [:destroy]
    resources :ingredients, only: [:index]
    resources :mymemos, only: [:show, :destroy, :create]
    resources :recipes, only: [:create, :new, :index, :show, :destroy] do
      collection do
        get :search
      end
    end
  end
  post "/users/recipes/new", to: "users/recipes#new"
  root to: "users/homes#top"

end
