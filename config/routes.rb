Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }

  resources :users, only: [:show]
  resources :developers, only: [:show, :index, :new, :create] do
    resource :projects, only: [:new, :create]
  end

  resources :projects, only: [:index]

  root 'developers#index'
end
