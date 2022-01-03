Rails.application.routes.draw do
  get 'sign_in', to: 'session#new', as: 'sign_in'
  post 'sign_in', to: 'session#create'
  delete 'logout', to: 'session#destroy', as: 'logout'

  get 'profile', to: 'profiles#show', as: 'profile'
  post 'profile', to: 'profiles#update'
  root "welcome#index"
end
