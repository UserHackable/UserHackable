class Project < ActiveRecord::Base
  def embed_url
    "//www.youtube.com/embed/#{youtube_id}"
  end
  def share_url
    "http://youtu.be/#{youtube_id}" 
  end
  def img_url
    "https://i.ytimg.com/vi_webp/#{youtube_id}/mqdefault.webp"
  end
end
