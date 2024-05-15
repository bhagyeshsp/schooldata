Rails.application.routes.draw do
  # Here we created nested routes to create students in context of the teacher
  resources :teachers do
    resources :students, only: [:new, :create]
  end
  # Other routes go here
  root "teachers#index"
  get "up" => "rails/health#show", as: :rails_health_check

 
end
