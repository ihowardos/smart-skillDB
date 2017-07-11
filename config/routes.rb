Rails.application.routes.draw do
  resources :skills
  
  devise_for :users, controllers: { registrations: "users_controllers/registrations" }

  get 'users/:id', to: 'profiles#show', as: 'users'
  get '/:page', to: 'pages#show', as: :page

  root 'pages#show',   page: 'home'
end
