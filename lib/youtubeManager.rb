require 'youtube_it'

class YoutubeManager

  def login username password
    YouTubeIt::Client.new(:username => username, :password => password);
  end
end
