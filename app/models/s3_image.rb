module S3Image
  def self.included(base)
    base.extend(ClassMethods)
    base.validates_attachment :image, content_type: { content_type: /^(image\/(gif|png|jpe?g))?$/}, allow_nil: true #, size: { less_than: 10.megabytes } 
#    base.process_in_background :image, processing_image_url: :image_url
#    base.after_post_process :clear_image_url
  end

  def image_url= url
    unless url.to_s.empty?
      url.sub!(/^\/\//,'http://')
      write_attribute(:image_url,URI.decode(url))
      self.image = URI.parse(URI.escape(image_url))
    end
  end

  def has_url?
    image_url.to_s.length > 0
  end

  def clear_image_url
    write_attribute(:image_url,nil)
  end

  module ClassMethods
    def update_old_images
      find_each do |t|
        begin
          unless t.has_url?
            t.image_url = t.s3_url
            t.save
          end
        rescue OpenURI::HTTPError 
          t.delete
        end
      end
    end

    def update_style st
      find_each do |t|
        unless t.image.exists? st
          t.image.reprocess! st
        end
      end
    end
  end
end

