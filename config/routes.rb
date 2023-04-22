Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/edit'
  get 'comments/update'
  get 'comments/destroy'
  resources :posts
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' },
                  path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  root to:'home#index'
  get 'home/index'
  devise_scope :user do             #rutas dentro de una cuenta
    get '/posts', to: 'posts#index'
    get '/posts/new', to: 'posts#new'
    post '/posts', to: 'posts#create'
    get '/posts/:id', to: 'posts#show'
    put '/posts/:id', to: 'posts#update'
    put '/posts/:id/edit', to: 'posts#edit', as: 'editing_post'
    delete '/posts/:id', to: 'posts#destroy'
  end
  resources :posts do
    resources :comments
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
