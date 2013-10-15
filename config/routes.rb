EnvironmentClassesGamification::Application.routes.draw do
  root :to => "users#show"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
  resources :problems do
    resources :answers
  end
  resources :results
  resources :cities, only: [:new, :create]
end
