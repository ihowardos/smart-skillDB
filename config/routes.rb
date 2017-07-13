Rails.application.routes.draw do
  resources :skills
  resources :users_skills
  resources :profile, only: [:show]

  devise_for :users, controllers: { registrations: "users_controllers/registrations" }

  get '/:page', to: 'pages#show', as: :page

  root 'pages#show',   page: 'home'
end
