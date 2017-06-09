Rails.application.routes.draw do
  resources :tweets, except: [:show] do
    collection do
      post :confirm
    end
  end

  root 'tweets#index'

end
