require File.expand_path("../test_helper", __FILE__)

class RMagickMetadataTest < MicroTest::Test

  test "initialize and populate data" do
    image_path = File.expand_path("../rails.png", __FILE__)
    assert File.exist? image_path

    data = ::RMagickMetadata.new(image_path)

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
    assert data.directory                                  =~ /\.*\/rmagick-metadata\/test/
    assert data.filename_suffix                            == 'png'
    assert data.filename_with_suffix                       == 'rails.png'
    assert data.layer_canvas_page_geometry                 == '50x64+0+0'
    assert data.current_height_in_pixels                   == '64'
    assert data.image_filename                             =~ /\.*\/rmagick-metadata\/test\/rails.png/
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
    assert data.magick_filename                            =~ /\.*\/rmagick-metadata\/test\/rails.png/
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
  end

end
