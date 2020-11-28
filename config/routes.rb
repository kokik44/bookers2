Rails.application.routes.draw do
 root 'home#index'
 get "home/about" => "home#show"

 # post 'users/:id' => 'books#create'
 devise_for :users, controllers: {registrations: 'users/registrations',
                                    sessions: 'users/sessions' }
 resources :users, only: [:show, :edit, :update, :create, :index]
 devise_scope :user do
      get "sign_in", :to => "devise/sessions#new"
      get "sign_out", :to => "devise/sessions#destroy"
      # post 'sign_in' => 'users#show'
 end
 resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
