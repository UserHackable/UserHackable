module ImageUploadHelper
  def image_hidden (f, options={}) 
    record = f.object
    prefix = options.delete(:prefix) || record.class.name.underscore.gsub('/','_') ## singular
    attachment = options.delete(:attachment) || Paperclip::AttachmentRegistry.names_for(record.class).first
    flds = %w(_file_size _content_type _id _url _path).collect{|suffix| (attachment.to_s + suffix).to_sym}
    html = "";
    flds.each do |field|
      html += f.hidden_field field
    end
    return raw(html)
  end

  # Paperclip::AttachmentRegistry.names_for Organization

  def image_upload (record, options = {})
    file_upload(record, options)
  end

  def file_upload (record, options = {})
    prefix = options.delete(:prefix) || record.class.name.underscore.gsub('/','_') ## singular
    file_prefix = options.delete(:file_prefix) || record.class.name.tableize ## plural
    progress_bar_target = options.delete(:progress_bar_target)

    attachment = options.delete(:attachment) || Paperclip::AttachmentRegistry.names_for(record.class).first
    return "" unless attachment;
    partial = options.delete(:partial) || 'upload/form'
    locals = { 
      prompt: options.delete(:prompt) || "Select File",
      multiple: options.delete(:multiple)
    }
    
    if options[:callback_url]
      options.reverse_merge!(
        callback_method: record.persisted? ? 'PUT' : 'POST',
        callback_param: "#{prefix}[#{attachment}_url]" 
      )
    end

    now = Time.now.to_s(:s3);
    options.reverse_merge!(
      data: { prefix: prefix, attachment: attachment, progress_bar_target: progress_bar_target },
      key: "#{file_prefix}/#{now}/#{attachment}/${filename}",
      key_starts_with: "#{file_prefix}/",
      id: "s3-uploader-#{prefix}-#{attachment}",
      max_file_size: 10.megabytes,
#      acl: 'public-read',
#      class: 'upload_form',
#      data: { optional: :data },
#      bucket: 
      class: 's3-uploader pull-right clear-right'
    )
    s3_uploader_form(options) do
      render partial: partial, locals: locals
    end 
  end

end

