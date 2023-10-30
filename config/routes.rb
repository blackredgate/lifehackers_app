Rails.application.routes.draw do
  root to: 'homes#top'

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  namespace :admin do
    resources :users, only:[:index, :show, :edit, :update]
    resources :lifehacks, only:[:index, :show, :destroy]
    resources :comments, only:[:destroy]
    resources :favorites, only:[:destroy]
    resources :items, only:[:index, :show, :destroy]
    resources :item_comments, only:[:destroy]
    resources :item_favorites, only:[:destroy]
  end

   scope module: :public do
    resources :users, only:[:show, :edit, :update]
    resources :lifehacks
    resources :comments, only:[:show, :new, :create, :edit, :update, :destroy]
    resource :favorites, only:[:create, :destroy]
    resources :items
    resources :item_comments, only:[:show, :new, :create, :edit, :update, :destroy]
    resource :item_favorites, only:[:create, :destroy]
  end
  
  get '/users/unsubscribe' => 'public/users#unsubscribe'
  patch '/users/withdraw' => 'public/usrs#withdraw'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
