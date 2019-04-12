Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/transference' => 'transference#create'
      get '/balance' => 'account#get_balance'
    end
  end
end
