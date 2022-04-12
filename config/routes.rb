Rails.application.routes.draw do
  get 'schedules/index'
  get 'schedule/index'
  get 'sort_by_date', to: 'schedules#sort_by_date'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :schedules
end
