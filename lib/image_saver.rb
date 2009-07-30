module ImageSaver
  def save_image(temp_file)
    content = temp_file.read
    filename = Digest::MD5.hexdigest(content)
    file_type = temp_file.original_filename.split(".").last
    path = "#{RAILS_ROOT}/public/equipment_images/#{filename[0,2]}/"
    Dir.mkdir(path) unless File.directory?(path)
    image_path = path + filename + "." + file_type
    File.open(image_path, "wb") do |file|
      file.write(content)
    end
    return "/equipment_images/#{filename[0,2]}/" + filename + "." + file_type
  end
end
