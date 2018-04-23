Rails.application.routes.draw do
  resources :classrooms
  resources :students
  post 'search', to: 'students#search', as: :search
end
