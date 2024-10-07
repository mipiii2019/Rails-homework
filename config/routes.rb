Rails.application.routes.draw do
  resources :tasks do
    member do
      get :complete
      delete :destroy
    end
  end

  delete 'clear_complete_tasks', to: 'tasks#clear_complete_tasks', as: 'clear_complete_tasks'
end