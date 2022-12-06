require 'administrate/field/base'

class ShrineField < Administrate::Field::Base
  def url
    (regular_url || version_url).to_s
  end

  def regular_url
    data.try(:url)
  end

  def version_url
    data.try(:[], version).try(:url)
  end

  def url_only?
    options.fetch(:url_only, false)
  end

  def version
    options.fetch(:version, nil)
  end

  def cached_value
    resource.send("cached_#{attribute}_data")
  end
end
