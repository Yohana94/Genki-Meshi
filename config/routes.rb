Rails.application.routes.draw do
  devise_for :users, controllers: {
  :registrations => 'users/registrations',
  :sessions => 'users/sessions',
  :passwords => 'users/passwords'
}

  devise_for :admins

  namespace :admins do
    resources :ingredients, only: [:new, :create]
    #   get 'ingredients/new'
    #   get 'ingredients/create'
    resources :users, only: [:index, :show,:edit, :update]
    #   get 'users/index'
    #   get 'users/show'
    #   get 'users/edit'
    #   patch 'users/update'
    resources :genres, only: [:index, :create,:edit, :update]
    # get 'genres/index'
    # post 'genres/create'
    # get 'genres/edit'
    # patch 'genres/update'
    resources :recipes, only: [:index, :create, :edit, :update, :new, :show]
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
  resources :calorie_dentakus, only: [:show]
   # get 'calorie_dentakus/show'
  resources :sessions, only: [:new, :create, :destroy]
    # get 'sessions/new'
    # post 'sessions/create'
    # delete 'sessions/destroy'
  resources :homes, only: [:top, :about]
    # get 'homes/top'
    # get 'homes/about'
  resources :ingredients, only: [:create, :new]
    # get 'ingredients/create'
    # get 'ingredients/new'
  resources :recipes, only: [:create, :new, :index, :show] do
      collection do
        get 'search', to: 'recipes#search'
      end
    end
  end

  root to: "users/homes#top"
end
