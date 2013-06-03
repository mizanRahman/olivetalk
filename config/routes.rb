Ot::Application.routes.draw do

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

  mount Refinery::Core::Engine, :at => '/university'
  mount RailsAdmin::Engine => '/manage', :as => 'rails_admin'

  resources :topics do
  		resources :posts
      resources :resources
  		resources :subscriptions
      # get "subscriptions/subscribe", to: "topics#approve"


  end

  resources :badgeships
  resources :badges
  resources :profiles do
	 resources :jobs
	 resources :degrees
  end
  resources :universities
  resources :resources
  resources :networks
  


  get 'topics/tag/:tag', to: 'topics#index', as: :topic_tag
  
  match 'topics/:id/approve' => 'topics#approve'

  get 'resources/tag/:tag', to: 'resources#index', as: :resource_tag

  # match "subscriptions/subscribe", to: "subscriptions#subscribe", via: "post"
  # match "subscriptions/unsubscribe", to: "subscriptions#unsubscribe", via: "post"
  # get "subscriptions/subscribe"
  # get "subscriptions/unsubscribe"
  
  root :to => "home#index"

end
