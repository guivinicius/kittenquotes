Rails.application.routes.draw do
  require "sidekiq/web"

  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == ENV["SIDEKIQ_USERNAME"] && password == ENV["SIDEKIQ_PASSWORD"]
  end if Rails.env.production?
  mount Sidekiq::Web, at: "/admin/sidekiq"

  root "subscribers#index"

  post "/subscribe", to: "subscribers#create"
  get "/unsubscribe", to: "subscribers#delete"
end
