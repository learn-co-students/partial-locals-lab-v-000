Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :students
  post 'students/search', to: 'students#search', as: :students_search
  resources :classrooms, only: [:show, :index]
end
