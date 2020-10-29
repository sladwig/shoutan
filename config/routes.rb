Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'games', to: 'games#index'
  post 'games', to: 'games#create'
  get 'games/:id', to: 'games#show'
  post 'games/:id', to: 'games#place'
  # delete 'games/:id', to: 'games#undo'

  mount ActionCable.server => '/cable'
end
