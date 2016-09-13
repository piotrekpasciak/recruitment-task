Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }

  resources :users, only: [:index, :destroy]
  resources :developers, only: [:show, :index, :new, :create] do
    resources :projects, only: [:new, :create] do
      resource :votes, only: [:create]
    end
  end

  resources :projects, only: [:index]
  resources :votes, only: [:destroy]
  resources :languages, only: [:index, :destroy]

  root 'developers#index'
end
