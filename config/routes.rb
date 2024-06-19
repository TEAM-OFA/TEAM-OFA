Rails.application.routes.draw do
  namespace :public do
    get 'search/search'
  end
  namespace :admin do
    get 'search/search'
  end
  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

scope module: :public do
  root :to =>"homes#top"
  get '/about' => 'homes#about'
  resources :items, only: [:index, :show]
  resources :customers, only: [:show, :edit, :update] do
    collection do
      get 'check'
      patch 'out'
    end
  get "search" => "searches#search"
  end

  resources :cart_items, only: [:index, :update, :create,:destroy] do
    collection do
      delete 'destroy_all'
    end
  end

  resources :orders, only: [:new, :create, :index, :show] do
    collection do
      get 'thanks'
      post "check"
    end
  end

  resources :addresses, except: [:new, :show]
end


  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    get '/' => 'homes#top'
    resources :items, except: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
    get "search" => "searches#search"
  end
  
end
