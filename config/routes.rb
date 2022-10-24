Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :lessons do
    resources :comments
  end

  resources :courses

  devise_scope :user do
    authenticated :user do
      root 'courses#index'
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

end
