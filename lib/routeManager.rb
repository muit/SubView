class RouteManager
  def self.get url, response
    if url.size == 0
      throw new Error "Url provided is empty!"
    end
    params = {url: url}.merge get_response_type response

    if params[:file] != nil
      get params[:url] do
        File.read("public/"+params[:file])
      end
    else
      get params[:url] do
        params[:controller]
      end
    end
  end

  def self.post url, response
    if url.size == 0
      throw new Error "Url provided is empty!"
    end
    params = {url: url}.merge get_response_type response

    if params[:file] != nil
      post params[:url] do
        File.read("public/"+params[:file])
      end
    else
      post params[:url] do
        params[:controller]
      end
    end
  end

  private

  def self.get_response_type response
    controller = nil
    file       = nil

    if response.is_a? String then file = response else controller = response end
    {file: file, controller: controller}
  end
end

require_relative "../config/routes.rb"
