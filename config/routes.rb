Rails.application.routes.draw do
  devise_for :users
  
  # devise_for :users, :skip => [:sessions]
  # as :user do
  #   get 'signin' => 'devise/sessions#new', :as => :new_session
  #   post 'signin' => 'devise/sessions#create', :as => :session
  #   match 'signout' => 'devise/sessions#destroy', :as => :destroy_session,
  #     :via => Devise.mappings[:user].sign_out_via
  # end

  get 'users/:id', to: 'users#show', as: "user"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "welcome#home"
  resources :trips
  resources :objectives
end
