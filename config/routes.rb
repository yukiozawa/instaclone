Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "pictures#index"

  resources :users
  resources :pictures do
    collection do
      post :confirm
    end
  end

  resources :favorites, only: [:create, :destroy, :index]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  
end
