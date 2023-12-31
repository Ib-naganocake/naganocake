Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  scope module: :public do
    root to: "homes#top"
    get "about" => "homes#about"
    resources :items, only: [:index, :show]
    resource :customers, only: [] do
      patch "update" => "customers#update"
      get "my_page" => "customers#show"
      get "information/edit" => "customers#edit"
      get "confirm_withdraw"
      patch "withdraw"
    end
    resources :cart_items, only: [:index, :update, :create, :destroy] do
      delete "destroy_all", on: :collection
    end
    resources :orders, only: [:new, :index, :show, :create] do
      collection do
        post :confirm
        get :complete
      end
    end
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :searches, only: [:index]
    resources :genres, only: [:show]
  end

  namespace :admin do
    root to: "homes#top"
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :index, :update] do
      resources :order_details, only: [:update]
    end
    resources :searches, only: [:index]
  end

end
