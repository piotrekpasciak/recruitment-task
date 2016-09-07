Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }

  root 'developers#index'

  resources :users, only: [:show]
  resources :developers, only: [:show, :index, :new, :create] do
    resource :projects, only: [:new, :create]
    # post '/projects' => 'projects#create'
    # get '/projects/new' => 'projects#new'
  end

  resources :projects, only: [:index]
end
