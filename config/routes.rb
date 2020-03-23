Rails.application.routes.draw do

  devise_scope :user do
    get 'login', to: 'users/sessions#new', as: :new_user_session
    post 'login', to: 'users/sessions#create', as: :user_session
    delete 'logout', to: 'users/sessions#destroy', as: :destroy_user_session
  end

  devise_for :users, skip: [:sessions],
  controllers: {
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  scope module: :users do
    resources :users, only:[:show,:edit,:update,:destroy]
  end

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }

  namespace :admins do
    resources :items, only:[:index,:new,:create,:show,:edit]
  end
end
