Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "creatures#index"

  get "/creatures", to: "creatures#index", as: "creatures"
end
