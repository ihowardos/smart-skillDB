Rails.application.routes.draw do
  resources :user_skills
  resources :skills
  resources :profile, only: [:show]
  resources :databases

  devise_for :users, controllers: { registrations: "users_controllers/registrations" }

  get '/:page', to: 'pages#show', page: 'about', as: :page

  root 'skills#index'
end
