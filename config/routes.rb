Rails.application.routes.draw do
  get 'sign_in', to: 'session#new', as: 'sign_in'
  post 'sign_in', to: 'session#create'
  delete 'logout', to: 'session#destroy', as: 'logout'

  get 'profile', to: 'profiles#show', as: 'profile'
  post 'profile', to: 'profiles#update'
  root "welcome#index"

  resource 'totp_managements', except: [:edit]
  get 'totp_managements/show', to: 'totp_managements#show', as: 'show_totp_managements'

  get 'totp_auth', to: 'totp_sessions#new', as: 'totp_auth'
  post 'totp_auth', to: 'totp_sessions#create'
end
