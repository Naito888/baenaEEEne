Rails.application.routes.draw do
  #devise_for :admins
  #devise_for :publics
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # 顧客用
# URL /publics/sign_in ...
devise_for :publics,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :public do
  get 'homes/top', to: 'homes#top'
end

end
