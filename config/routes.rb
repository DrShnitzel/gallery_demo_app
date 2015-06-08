Rails.application.routes.draw do

  scope 'api', format: 'json' do
    scope 'users' do
      post '/', to: 'users#create'
      delete '/', to: 'users#destroy'
      put 'password', to: 'users#update_passwd'
      post 'login', to: 'users#login'
      post 'logout', to: 'users#logout'
      get ':user_id/media_data', to: 'media_data#index'
      post 'media_data', to: 'media_data#create'
    end
  end
end
