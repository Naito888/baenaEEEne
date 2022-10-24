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

namespace :customer do
  get 'homes/top', to: 'homes#top'
end

end
