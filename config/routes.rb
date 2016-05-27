Rails.application.routes.draw do
  resources :items do
    member do
      get 'sold'
      get 'unsold'
    end
  end
  resources :charges
  root to: 'garage#index'
end
