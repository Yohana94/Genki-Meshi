Rails.application.routes.draw do
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
