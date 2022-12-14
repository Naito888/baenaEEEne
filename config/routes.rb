Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

# ゲストログイン用
devise_scope :customer do
  post 'customers/guest_sign_in', to: 'customer/sessions#new_guest'
end

  # 顧客用
# URL /customer/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

root :to =>  "customer/posts#index"

namespace :customer do

  get 'homes/about'
  get 'customers/mypage' => 'customers#show', as: 'mypage'
  get 'customers/mypage/edit' => 'customers#edit', as: 'edit'

  resources :customers, only:[:show, :edit, :update] do
    #resources :follows, only:[:index, :create, :destroy]
    resource :follows, only: [:create, :destroy]
    get 'followings' => 'follows#followings', as: 'followings'
    get 'followers' => 'follows#followers', as: 'followers'
    get :search, on: :collection
  end

  get 'likes' => 'likes#index'
  resources :posts, only:[:index, :new, :create, :confirm, :show, :edit, :update, :destroy, :destroy_all] do
    resources :comments, only:[:create, :destroy]
    resource :likes, only: [:create, :destroy]
    get :search, on: :collection
  end


end


namespace :admin do

  get '/'  => 'homes#top'
  resources :posts, only:[:index, :new, :create, :show, :edit, :update, :destroy, :destroy_all]
  resources :customers, only:[:index, :show, :edit, :update, :destroy]
  resources :comments, only:[:index, :edit, :create, :update, :destroy]

end


end
