Rails.application.routes.draw do
  resources :overages do
    collection { post :import }
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'overages#index'
end
