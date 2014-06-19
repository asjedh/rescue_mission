Rails.application.routes.draw do

  resources :questions
  resources :users, only: [:create, :new]

  resources :sessions, only: [:new, :create, :destroy]

  resources :questions do
    resources :answers, only: :create
  end

end
