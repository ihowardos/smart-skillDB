Rails.application.routes.draw do
  resources :user_skills
  resources :skills
  resources :profile, only: [:show]

  devise_for :users, controllers: { registrations: "users_controllers/registrations" }

  get '/:page', to: 'pages#show', page: 'about', as: :page

  root 'pages#show',   page: 'home'
end
