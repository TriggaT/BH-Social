Rails.application.routes.draw do

  root 'welcome#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  
  resources :users, only: [:new, :create, :show]

  resources :topics, only: :show do
    resources :questions
    resources :posts
  end

  resources :questions do 
    resources :comments
  end 

  resources :posts do 
    resources :comments
  end 


  post "topics/:topic_id/questions/:id/solved", to: "questions#solved", as: 'solved'
  match "users/most-frequent-poster", to: "users#mf_poster", as: "most_posts", via: [:get, :post]

  match '/auth/:provider/callback', to: 'sessions#github', via: [:get, :post] 
  get 'auth/failure', to:  'users#new'

  
end
