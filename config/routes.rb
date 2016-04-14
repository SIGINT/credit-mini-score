Rails.application.routes.draw do

  root to: 'loan_applications#index'

  match '/auth/:provider/callback', to: 'sessions#create', via: [ :get, :post ]
  match 'auth/failure', to: 'loan_applications#index', via: [ :get, :post ]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [ :get, :post ]

  resources :loan_applications, path: :applications

  resources :businesses, only: [ :update, :create, :show ] do
    resources :business_owners, only: [ :update, :create ]
  end

end
