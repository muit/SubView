class RouteManager
  @@gets  = []
  @@posts = []

  def self.get url view
    @@gets.push ({url: url, view: view})
  end
  def self.post url view
    @@posts.push({url: url, view: view})
  end

  def self.apply
    @@gets.each do |route|
      get route.url do
        route.view
      end
    end
    @@posts.each do |route|
      post route.url do
        route.view
      end
    end
  end
end

require_relative "../config/routes.rb"
