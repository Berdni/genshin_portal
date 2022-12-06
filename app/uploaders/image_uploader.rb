require 'image_processing/mini_magick'

class ImageUploader < Shrine
  Attacher.derivatives do |original|
    vips = ImageProcessing::MiniMagick.source(original)

    {
      optimized: vips.quality(80).convert!('webp')
    }
  end

  Attacher.validate do
    validate_mime_type %w[image/jpeg image/png image/webp]
    validate_max_size  1 * 1024 * 1024
  end
end
