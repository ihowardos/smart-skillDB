Rails.application.routes.draw do
  resources :user_skills, except:[:new, :edit]
  resources :skills, only:[:create, :destroy, :index]
  resources :profile, only: [:show]
  resources :databases, only: [:index]

  devise_for :users, controllers: { registrations: "users_controllers/registrations" }

  get '/:page', to: 'pages#show', page: 'about', as: :page

  root 'skills#index'
end
