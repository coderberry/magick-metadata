class RMagickMetadata

  def initialize( file_path )
      
    # Create attr_accessors for all keys in the data_map
    data_map.each do |k, v|
      create_attr v
    end

    # Get the data for the image using 'identify'
    format_str = data_map.keys.map{|k|"%#{k}"}.join('|')
    data = %x[identify -format "#{format_str}" #{file_path}].chomp

    # Parse the data response and assign it to the instance values
    data.split('|').each_with_index do |val, idx|
      attr_name = data_map.values[idx]
      instance_variable_set("@#{attr_name}", val)
    end

  end

  # Helper methods

  def has_transparency?
    @image_transparency_channel_enabled == 'True'
  end

  def dimensions
    [@current_width_in_pixels.to_i, @current_height_in_pixels.to_i]
  end

  def file_size
    @file_size_of_image.scan(/\d/).join().to_i if @file_size_of_image
  end

  def resolution
    @x_resolution_density.scan(/\d/).join().to_i if @x_resolution_density
  end

  def compression_percent
    @image_compression_quality.to_f if @image_compression_quality
  end

  def width
    dimensions[0]
  end

  def height
    dimensions[1]
  end

protected

  def data_map
    {
      'b' => 'file_size_of_image',
      'c' => 'comment',
      'd' => 'directory',
      'e' => 'filename_suffix',
      'f' => 'filename_with_suffix',
      'g' => 'layer_canvas_page_geometry',
      'h' => 'current_height_in_pixels',
      'i' => 'image_filename',
      'k' => 'calculated_number_of_unique_colors',
      'l' => 'label',
      'm' => 'image_file_format',
      'n' => 'number_of_images_in_current_image_sequence',
      'o' => 'output_filename',
      'p' => 'index_of_image_in_current_image_list',
      'q' => 'quantum_depth',
      'r' => 'image_class_and_colorspace',
      's' => 'scene_number',
      't' => 'filename_without_directory_or_extension',
      'u' => 'unique_temporary_filename',
      'w' => 'current_width_in_pixels',
      'x' => 'x_resolution_density',
      'y' => 'y_resolution_density',
      'z' => 'image_depth',
      'A' => 'image_transparency_channel_enabled',
      'C' => 'image_compression_type',
      'D' => 'image_gif_dispose_method',
      'G' => 'image_size_w_x_h',
      'H' => 'page_canvas_height',
      'M' => 'magick_filename',
      'O' => 'page_canvas_offset',
      'P' => 'page_canvas_size',
      'Q' => 'image_compression_quality',
      'S' => 'scenes',
      'T' => 'image_time_delay',
      'W' => 'page_canvas_width',
      'X' => 'page_canvas_x_offset',
      'Y' => 'page_canvas_y_offset',
      'Z' => 'unique_filename',
      '@' => 'calculated_trim_bounding_box',
      '#' => 'calculated_signature_hash_of_image_values'
    }
  end

  def create_method( name, &block )
    self.class.send( :define_method, name, &block )
  end

  def create_attr( name )
    create_method( "#{name}=".to_sym ) { |val| 
      instance_variable_set( "@" + name, val)
    }

    create_method( name.to_sym ) { 
      instance_variable_get( "@" + name )
    }
  end

end
