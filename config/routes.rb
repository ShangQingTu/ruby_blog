Rails.application.routes.draw do
  get 'welcome/index'

  resources :articles do
    resources :viewers, controller: "article_viewers"
  end

  root 'welcome#index'

  # 不区分get post这不好
  # match ':controller(/:action(/:id(.:format)))', :via => :all
end