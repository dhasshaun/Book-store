Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "books#index"

  get '/users', to: 'users#show'
  get '/books', to: 'books#index'
  post '/users/orders', to: 'orders#create'

  devise_for :users,
             path: '',
             path_names: {
               sign_in: 'login',
               sign_out: 'users',
               registration: 'users'
             },
             controllers: {
               sessions: 'sessions',
               registrations: 'registrations'
             }
end
