Rails.application.routes.draw do

    namespace :api do
        namespace :v1 do
            resources :users, only: [:index, :show] do
                member do
                    get :following, :followers
                end
                resources :posts do
                    resources :comments, only: [:create, :destroy]
                    resources :likes, only: [:create, :destroy]
                end
            end
            resources :relationships, only: [:create]
            
            mount ActionCable.server => '/cable'

            post 'check_follow' => 'users#check_follow'
            
            get 'current_user' => 'users#current'

            get '/posts/:post_id/likes', to: 'likes#index'
            get '/posts/:post_id/comments', to: 'comments#index'
            
            post '/chat/exists', to: 'conversations#exists'
            post '/chat/history', to: 'conversations#history'
            post '/chat/create', to: 'conversations#create'

            get'/user/:user_id/post/:post_id/check_like', to:'likes#check' 
            
            get '/users/find/:username', to: 'users#get'
            
            get '/user/:user_id/posts', to: 'posts#show_by_user'
            
            post 'user_token' => 'user_token#create'
            post '/signup',  to: 'users#create'
            
            patch '/edit/:id', to: 'users#update'
            
            delete '/edit/:id', to: 'users#destroy'

            post '/unfollow', to: 'relationships#destroy'

        end
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

