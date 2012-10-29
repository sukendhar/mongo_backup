Tribally::Application.routes.draw do
 
resources :locations

ActiveAdmin.routes(self)

devise_for :admin_users, ActiveAdmin::Devise.config

resources :products do
	collection do 
		post "add_comment"
    post "create_offer"
    get "solar"
    post "product_group"
    get "solar_offers"
    get "solar_group_offers"
    get "solar_new_group_offers"
    #post "solar_offers"
	end
end

resources :businesses do
  collection do
    get "business_signup"
  end
end

  
resources :tribes do
    collection do
      get "change_invitation_status"
      get "my_tribe"
      get "tribe_products"
      get "i_want_this"
      post "invite_friend"
      get "solar"
     end
end
 


  root :to => "products#solar"
  devise_for :users,  :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  #devise_scope :user do
  #  get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
  #end
  resources :users, :only => [:show, :index]
end

