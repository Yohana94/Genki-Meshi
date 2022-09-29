Rails.application.routes.draw do
  namespace :admins do
    get 'ingredients/new'
    get 'ingredients/create'
  end
  namespace :admins do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
    get 'users/update'
  end
  namespace :admins do
    get 'genres/index'
    get 'genres/create'
    get 'genres/edit'
    get 'genres/update'
  end
  namespace :admins do
    get 'recipes/index'
    get 'recipes/new'
    get 'recipes/create'
    get 'recipes/update'
    get 'recipes/show'
    get 'recipes/edit'
  end
  namespace :admins do
    get 'homes/top'
  end
  namespace :users do
    get 'calorie_dentaku/show'
  end
  namespace :users do
    get 'sessions/new'
    get 'sessions/create'
    get 'sessions/destroy'
  end
  devise_for :users
  devise_for :admins

  namespace :users do
    get 'homes/top'
    get 'homes/about'
  end
  namespace :users do
    get 'ingredients/create'
    get 'ingredients/new'
  end
  namespace :users do
    get 'recipes/index'
    get 'recipes/create'
    get 'recipes/new'
    get 'recipes/show'
  end

  root to: "users/homes#top"
end
