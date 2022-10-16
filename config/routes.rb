Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/apartments', to: 'apartments#index'
  get '/apartments/new', to: 'apartments#new'
  
  get '/apartments/:id', to: 'apartments#show'
  get '/apartments/:id/edit', to: 'apartments#edit'
  patch '/apartments/:id', to: 'apartments#update'
  post '/apartments', to: 'apartments#create'

  get '/tenants', to: 'tenants#index'
  get '/tenants/:id', to: 'tenants#show'
  get '/apartments/:apartment_id/tenants', to: 'apartment_tenants#index'

end
