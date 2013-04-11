module Actions
  class Router
    include Rails.application.routes.url_helpers if Rails.application.present?
  end
end