Brainwo::Application.routes.draw do
  devise_for :owners
  
  namespace :owner do
    root 'quizzes#index'
    resources :teams, except: :show
    resources :questions
    resources :quizzes do
      resources :teams
      get 'judgement' => 'judgement#index'
      get 'judgement/:team_id' => 'judgement#show', as: :judgement_team
      post 'judgement/:team_id/hurt' => 'judgement#hurt', as: :judgement_hurt
      post 'judgement/:team_id/toggle_status' => 'judgement#toggle_status', as: :judgement_toggle_status
    end
    

    get 'game/:quiz_id/rate' => 'game#rate', as: :game_rate
    post 'game/:quiz_id/fill_teams_answers' => 'game#fill_teams_answers', as: :fill_teams_answers
    put 'game/:quiz_id/start' => 'game#start', as: :start_game
    put 'game/:quiz_id/close' => 'game#close', as: :close_game
    get 'game/:quiz_id/set_question/:question_id' => 'game#set_question', as: :set_game_question
    get 'game/:quiz_id' => 'game#show', as: :game
    get 'game/:quiz_id/question/:question_id' => 'game#question', as: :game_question
    get 'game/:quiz_id/results/rating' => 'results#rating', as: :game_rating
    get 'game/:quiz_id/results/punishment' => 'results#punishment', as: :game_punishment
  end
  
  resources :quizzes, only: [:index, :show] do
    member do
      post 'should_i_reload_page'
    end
  end
  
  root 'home#index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
