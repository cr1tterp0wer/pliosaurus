Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :session, only:[:new, :create,:destroy]
  resources :users do |u|
    resources :location, only: [:index, :new,:create, :destroy]
  end
  resources :groups
  resources :groupusers
end
