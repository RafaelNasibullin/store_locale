Rails.application.routes.draw do
	devise_for :users
	scope ":locale", locale: /en|ru/ do
	  root 'products#index'
	  get 'products/:id/show_product' => 'products#show_product', as: 'products_show_product'
	  get 'products/:id/show_category' => 'products#show_category', as: 'products_show_category'
	  get 'products/update_avatar'
	  post 'products/save_avatar'

	  namespace :admin do
	    root 'products#index'
	    resources :products
	    resources :categories
	  end
	end
	match "*path", to: redirect("/#{I18n.default_locale}/%{path}"), via: :all
	match "", to: redirect("/#{I18n.default_locale}/"), via: :all

end
