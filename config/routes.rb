R20130411Scrabble::Application.routes.draw do
  root :to => 'welcome#index'

  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
  post '/channel' => 'channels#create'
  get '/refresh' => 'channels#refresh'

  post '/chat' => 'game#chat'
  end
