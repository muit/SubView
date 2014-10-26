# Routes List
#####################################
# Examples:
#   RouteManager.get "url", "file_path"
#   RouteManager.get "url", ControllerName
##
#RouteManager.get "/", "index.html"
get "/" do
  File.read("public/"+"index.html")
end
#####################################

