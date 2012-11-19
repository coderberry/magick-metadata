### NOTE: This gem has been renamed from rmagick-metadata to magick-metadata

# Magick::Metadata

Parses an image using ImageMagick and parses the metadata.

For this gem to work, [ImageMagick](http://www.imagemagick.org/script/index.php) must be installed.

## Installation

Add this line to your application's Gemfile:

    gem 'magick-metadata'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install magick-metadata

## Usage

```ruby
image_path = "/my_rails_app/app/assets/images/rails.png"

data = MagickMetadata.new(image_path)

# Helpers
assert data.filename_suffix                            == 'png'
assert data.has_transparency?                          == true
assert data.dimensions                                 == [ 50, 64 ]
assert data.width                                      == 50
assert data.height                                     == 64
assert data.file_size                                  == 6646
assert data.resolution                                 == 72
assert data.compression_percent                        == 0.0

# Auto-populated
assert data.file_size_of_image                         == '6646B'
assert data.comment                                    == ''
assert data.directory                                  =~ /\.*\/magick-metadata\/test/
assert data.filename_suffix                            == 'png'
assert data.filename_with_suffix                       == 'rails.png'
assert data.layer_canvas_page_geometry                 == '50x64+0+0'
assert data.current_height_in_pixels                   == '64'
assert data.image_filename                             =~ /\.*\/magick-metadata\/test\/rails.png/
assert data.calculated_number_of_unique_colors         == '2018'
assert data.label                                      == ''
assert data.image_file_format                          == 'PNG'
assert data.number_of_images_in_current_image_sequence == '1'
assert data.output_filename                            == ''
assert data.index_of_image_in_current_image_list       == '0'
assert data.quantum_depth                              == '16'
assert data.image_class_and_colorspace                 == 'DirectClass sRGB Matte'
assert data.scene_number                               == '0'
assert data.filename_without_directory_or_extension    == 'rails'
assert data.unique_temporary_filename                  == ''
assert data.current_width_in_pixels                    == '50'
assert data.x_resolution_density                       == '72 Undefined'
assert data.y_resolution_density                       == '72 Undefined'
assert data.image_depth                                == '8'
assert data.image_transparency_channel_enabled         == 'True'
assert data.image_compression_type                     == 'Zip'
assert data.image_gif_dispose_method                   == 'Undefined'
assert data.image_size_w_x_h                           == '50x64'
assert data.page_canvas_height                         == '64'
assert data.magick_filename                            =~ /\.*\/magick-metadata\/test\/rails.png/
assert data.page_canvas_offset                         == '+0+0'
assert data.page_canvas_size                           == '50x64'
assert data.image_compression_quality                  == '0'
assert data.scenes                                     == '2147483647'
assert data.image_time_delay                           == '0'
assert data.page_canvas_width                          == '50'
assert data.page_canvas_x_offset                       == '0'
assert data.page_canvas_y_offset                       == '0'
assert data.unique_filename                            == ''
assert data.calculated_trim_bounding_box               == '50x64+0+0'
assert data.calculated_signature_hash_of_image_values  == 'ae231a37d573c2ef941f3345932183b58cf5c0e6a569839d931b6172cebdbe27'
```

## Usage with CarrierWave

If you would like to use this gem along with [CarrierWave](https://github.com/jnicklas/carrierwave), place the following into your uploader file:

```ruby
process :store_metadata
def store_metadata
  if @file
    metadata = ::MagickMetadata.new(@file.path)
    model.content_type        = metadata.image_file_format
    model.file_size           = metadata.file_size
    model.width               = metadata.width
    model.height              = metadata.height
    model.filename_suffix     = metadata.filename_suffix
    model.is_transparency     = metadata.has_transparency?
    model.resolution          = metadata.resolution
    model.compression_percent = metadata.image_compression_quality
    model.file_name           = metadata.filename_with_suffix
    model.unique_color_count  = metadata.calculated_number_of_unique_colors
    model.file_format         = metadata.image_file_format
  end
end
```

## Testing

The gem is fully tested using [MicroTest](http://hopsoft.github.com/micro_test/). Use the command `mt` to perform the tests.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
