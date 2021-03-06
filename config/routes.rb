Rails.application.routes.draw do
 
  devise_for :users
  root to: "boards#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :boards, only: [:show, :new, :create, :edit, :update,  :destroy] do
    resources :tasks, only: [:new, :create, :show, :edit, :update, :destroy] do
      resources :comments, only: [:new, :create]
    end
  end
end
