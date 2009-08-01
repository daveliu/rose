module ImageSaver
  def save_image(image_param)
    return nil if image_param.nil?
    path = "#{RAILS_ROOT}/public/upload_images"
    Dir.mkdir(path) unless File.directory?(path)
    image = UploadImage.create!(image_param)
    image.id
  end
end
