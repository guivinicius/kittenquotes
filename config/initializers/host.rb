Rails.application.routes.default_url_options[:host] = if Rails.env.production?
  'kittenquote.herokuapp.com'
else
  'localhost:3000'
end
