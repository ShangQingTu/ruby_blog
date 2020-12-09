Rails.application.routes.draw do
  get 'welcome/index'

  resources :articles

  root 'welcome#index'

  match ':controller(/:action(/:id(.:format)))', :via => :all
end