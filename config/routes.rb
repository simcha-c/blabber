Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/demo', to: 'demos#bananas'
  # resources :blabs, except: [:new, :edit] # , only: [:index]
  
  root to: 'static_pages#root' # will render index of blabs at root url
  # if we go to "/" we will be taken to the root page
  
  # get '/blabs', to: 'blabs#index'
  #if I receive a get with this path, then do this action
  
  # post '/blabs', to: 'blabs#create'
  # get '/blabs/:id', to: 'blabs#show', as: 'blab'
  # patch '/blabs/:id', to: 'blabs#update'
  # delete '/blabs/:id', to: 'blabs#destroy'
  resources :blabs

  namespace :api, defaults: { format: 'json' } do
    resources :blabs, only: [:index, :create, :show]
    resources :users, only: [:show, :index, :create]
  end

  resources :users, only: [:new, :create]
  
  # 'resource' indicates we will only ever care about a singular session
  resource :session, only: [:new, :create, :destroy]
  
  # get '/set_cookie', to: 'blabs#set_cookie'
  # get '/get_cookie', to: 'blabs#get_cookie'
  # resources :blabs, except: [:edit] - this is how you do all routes with exceptions
  # resources :blabs, only: [:new, :edit]
end
