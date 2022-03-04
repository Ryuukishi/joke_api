# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  scope '/api'  do
    get '/jokes', to: 'jokes#index'
    post '/jokes', to: 'jokes#create'
    get '/jokes/random', to: 'jokes#random'
    get '/jokes/:id', to: 'jokes#show'
    put '/jokes/:id', to: 'jokes#update'
    delete '/jokes/:id', to: 'jokes#destroy'
  end
end
