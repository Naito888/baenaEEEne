Rails.application.routes.draw do
  #devise_for :customers
  #devise_for :admins
  #devise_for :publics
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html



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


root :to =>  "customer/homes#top"


namespace :customer do
  
end


namespace :admin do
    
  get '/'  => 'homes#top'
  resources :posts, only:[:index, :new, :create, :show, :edit, :update]
  resources :customers, only:[:index, :show, :edit, :update]
  resources :comments, only:[:index, :edit, :create, :update]
  
end



end
