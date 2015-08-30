Rails.application.routes.draw do
  root "subscribers#index"

  post "/subscribe", to: "subscribers#create"
end
