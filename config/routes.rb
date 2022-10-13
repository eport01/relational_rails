Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/apartments', to: 'apartments#index'
  get '/apartments/:id', to: 'apartments#list'
  get '/apartments/new', to: 'apartments#new'
  post '/apartments', to: 'apartments#create'

  get '/tenants', to: 'tenants#index'
  get '/tenants/:id', to: 'tenants#show'

end
