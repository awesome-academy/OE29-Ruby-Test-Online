Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "account#index"

    get "/help", to: "static_pages#help"
    get "/home", to: "static_pages#home"
    get "/about", to: "static_pages#about"
    get "/contact", to: "static_pages#contact"
    get "/signup", to: "users#new"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    get "account/index"

    resources :users
    resources :account_activations, only: :edit
    resources :password_resets, except: %i(index show destroy)
    namespace :trainers do
      resources :questions
    end
  end
end
