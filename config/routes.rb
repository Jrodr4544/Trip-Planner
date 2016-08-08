Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # including omniauth callback controller for when a user signs in
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  get 'users/:id', to: 'users#show', as: "user"

  root to: "welcome#home"
  delete  '/trips/:trip_id/objectives/:id' => 'objectives#destroy', as: "kill_objective"
  
  # Nesting resources for trip objectives
  resources :trips do  
    resources :objectives
  end

  resources :locations

  resources :objectives, :only => [:new, :update]
  post "/objectives" => "objectives#create", :as => :create_objective
end
