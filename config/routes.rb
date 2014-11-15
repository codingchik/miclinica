Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'application#angular'
   resources :clinics, only: [:create, :index, :show] do
    resources :reviews, only: [:show, :create] do
      member do
        put '/upvote' => 'reviews#upvote'
      end
    end

    member do
      put '/upvote' => 'clinics#upvote'
    end
  end
end
