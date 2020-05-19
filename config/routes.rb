Rails.application.routes.draw do
  devise_for :users
  resources :portfolios, except: [:show]
  get 'vue-items', to: 'portfolios#vue'
  get 'ruby-on-rails-items', to: 'portfolios#ruby_on_rails'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs do
    member do
      get :toggel_status
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
end
