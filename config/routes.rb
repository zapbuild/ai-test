Rails.application.routes.draw do
  devise_for :users
  # root :to => "devise/sessions#new"
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  get 'dashboard', to: "dashboard#index"

  get 'tweets', to: "tweets#index"

  get'my_followers', to: 'users#my_followers'
  get 'users', to: "users#all_users"
  get 'users/my_followers', to: "users#all_users"
  post 'follow', to: 'users#follow'
  get 'my_tweets', to: "tweets#my_tweets"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
