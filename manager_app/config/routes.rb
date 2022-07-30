Rails.application.routes.draw do
  resources :payment_requests, only: [:index, :show, :edit, :update] do
    patch :approve, on: :member
    patch :reject, on: :member
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "payment_requests#index"
end
