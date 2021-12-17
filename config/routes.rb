Rails.application.routes.draw do

  root 'home#index'

  resources :messages, only: [:new, :create]

  resources :crossfit_name_generator, only: [:new, :create]

  resources :words

  resources :financial_entries

  resources :blog_posts
  get '/sitemap.xml', to: 'pages#sitemap', :format => "xml", :as => :sitemap

  get 'blog/new', to: 'blog_posts#new'
  post 'blog/login', to: 'blog_posts#verify'
  post 'blog/logout', to: 'blog_posts#logout', as: "logout"

  get '/blog' => 'blog_posts#index', as: "blog"
  get '/blog/:slug', to: 'blog_posts#show'
  #get '/blog' => "pages#blog"

  get '/twilio_inbox' => 'twilio#inbox'
  get '/twilio' => 'twilio#index'

  get '/twilio_reminders' => 'twilio_reminders#index'

  post '/twilio_reminders' => 'twilio_reminders#create'

  get '/send_reminder/:id' => 'twilio_reminders#send_reminder', as: "send_reminder"

  get '/delete_reminder/:id' => 'twilio_reminders#delete_reminder', as: "delete_reminder"

  get '/cookie_voting', to: "cookie_voting#index"

  post '/business-hook' => 'fitnesstexter#webhook'

  resources :contact_form, only: [:index, :new, :create]


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
