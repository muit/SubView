class RouteManager
  @@gets  = []
  @@posts = []

  def self.get url, controller, view
    @@gets.push ({url: url, controller: controller, view: view})
  end
  def self.post url, controller, view
    @@posts.push({url: url, controller: controller, view: view})
  end

  def self.apply
    @@gets.each do |route|
      get route.url do
        route.view
      end
    end
    @@posts.each do |route|
      post route.url do
        # Call the controller method
      end
    end
  end
end

require_relative "../config/routes.rb"
