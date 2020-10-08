Rails.application.routes.draw do
  post :authenticate, to: 'auth#authenticate'
  get :find, to: 'zip_codes#find', format: :json
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
