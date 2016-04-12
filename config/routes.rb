Rails.application.routes.draw do

  resources :loan_applications, path: :applications

  resources :businesses, only: [ :update, :create, :show ] do
    resources :business_owners, only: [ :update, :create ]
  end

  root to: 'applications#index'

end
