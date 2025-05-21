Rails.application.routes.draw do
  devise_for :users
  resources :plans, only: [:show] do
    collection do
      post 'activities/:activity_id/complete', to: 'plans#complete_activity'
    end
  end
end
