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
    resources :items, only:[:index,:show]
    resources :cart_items, only:[:index,:create,:update,:destroy] do
      collection do
        delete 'clear' # カートを空にする
      end
    end
    resources :orders, only:[:new,:index,:show,:create] do
      collection do
        get 'confirm'   # 購入情報確認画面
        post 'storage'  # セッションに保存
        get 'complete'  # 購入完了画面
      end
    end
  end

  ######## 管理側 ########
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }

  namespace :admins do
    resources :items, except:[:destroy]
    resources :users, only:[:index,:show,:edit,:update,:destroy] do
      member do
        patch 'restore'
      end
    end
  end
  
end
