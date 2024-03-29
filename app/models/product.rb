class Product < ActiveRecord::Base

  has_attached_file :image, :styles => { 
    :medium => "300x300", 
    :thumb => "100x100"
  }
  include S3Image

end
