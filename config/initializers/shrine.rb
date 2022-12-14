require 'shrine'
require 'shrine/storage/file_system'
require 'shrine/storage/memory'

if Rails.env.test?
  Shrine.storages = {
    cache: Shrine::Storage::Memory.new,
    store: Shrine::Storage::Memory.new
  }
else
  Shrine.storages = {
    cache: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/cache'), # temporary
    store: Shrine::Storage::FileSystem.new('public', prefix: 'uploads') # permanent
  }
end

Shrine.plugin :activerecord # loads Active Record integration
Shrine.plugin :cached_attachment_data # enables retaining cached file across form redisplays
Shrine.plugin :restore_cached_data  # extracts metadata for assigned cached files
Shrine.plugin :determine_mime_type
Shrine.plugin :pretty_location
Shrine.plugin :default_url
Shrine.plugin :validation_helpers
Shrine.plugin :validation
Shrine.plugin :derivatives, versions_compatibility: true
Shrine.plugin :backgrounding

Shrine::Attacher.promote_block do
  PromoteJob.perform_async(
    self.class.name, record.class.name, record.id, name.to_s, file_data.to_json
  )
end

Shrine::Attacher.default_url do |derivative: nil, **|
  file&.url if derivative
end
