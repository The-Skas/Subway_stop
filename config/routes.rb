App123::Application.routes.draw do
  get '/start', to: 'home#start'
  get '/b', to: 'home#b'
  get '/1', to: 'home#one', as: :one
  get '/2', to: 'home#two', as: :two
  get '/3', to: 'home#three', as: :three
  get '/choice', to:'home#choice'
  get '/david', to: 'david#index'

  post '/calc', to: 'home#calc'
  root to: 'home#start'
end
