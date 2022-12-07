require 'image_processing/mini_magick'

class ImageUploader < Shrine
  Attacher.derivatives do |original|
    magick = ImageProcessing::MiniMagick.source(original)

    {
      optimized: magick.quality(80).convert!('webp')
    }
  end

  Attacher.validate do
    validate_mime_type %w[image/jpeg image/png image/webp]
    validate_max_size  1 * 1024 * 1024
  end

  def generate_location(io, record: nil, derivative: nil, **)
    location = super
    prefix = derivative || 'original'
    if record.is_a?(Hero)
      location = "#{File.dirname(location)}/#{record.slug}-#{prefix}#{File.extname(location)}"
    end

    location
  end
end
