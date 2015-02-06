class Project < ActiveRecord::Base
  def embed_url
    "//www.youtube.com/embed/#{youtube_id}"
  end
  def share_url
    "http://youtu.be/#{youtube_id}" 
  end
end
