EnvironmentClassesGamification::Application.routes.draw do
  root :to => "users#show"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
  resources :problems, only: [:new, :create, :edit, :update]
  resources :answers, only: [:index, :new, :create, :edit, :update]
  resources :results, only: [:new, :create, :edit, :update]
  resources :cities, only: [:new, :create]
end
