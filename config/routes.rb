Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users_controllers/registrations" }

end
