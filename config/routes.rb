BallotBreakdown::Application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'application#welcome'
  
  authenticate :voter, lambda { |v| v.admin? } do
    mount Upmin::Engine => '/admin'
  end
  
  resources :info

  devise_for :voters, :controllers => {:sessions => 'sessions'}
  
  resources :voters do
    resources :ballots do
      resources :offices do
        collection do |variable|
          get 'another_new'      
        end
        resources :politicians
      end
      resources :votes do
        member do
          get 'easy_votes'
          get 'undecided_votes'
          get 'where_was_i'
          get 'under_construction'
          get 'ready_for_the_election'
        end
      end
      resources :office_steps
      resources :politicians
    end
    resources :votes do
      member do
        get 'easy_votes'
        get 'undecided_votes'
        get 'where_was_i'
        get 'under_construction'
        get 'ready_for_the_election'
      end
    end
    resources :ballot_steps
  end
  
  resources :notes, :votes, :politicians, :ballots, :ballot_steps

  resources :offices do
    collection do |variable|
      get 'another_new'      
    end
  end
  resources :office_steps
  
  match '*a', to: 'application#welcome', via: [:get, :post]
  
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
