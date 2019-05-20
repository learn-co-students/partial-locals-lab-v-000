Rails.application.routes.draw do
  post 'students/search' => 'students#search'
  resources :classrooms
  resources :students
end
