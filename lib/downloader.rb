# frozen_string_literal: true

require 'open-uri'

class Downloader
  def initialize(path)
    @path = path
  end

  def download(name, url)
    filename_xls = format('%<path>s/%<name>s.xls', path: @path, name: name)
    filename_xlsx = format('%<path>s/%<name>s.xlsx', path: @path, name: name)

    return filename_xls if File.exist?(filename_xls)
    return filename_xlsx if File.exist?(filename_xlsx)

    URI.parse(url).open do |stream|
      filename = filename_by_stream(stream, filename_xls, filename_xlsx)
      File.binwrite(filename, stream.read)
      filename
    end
  end

  def filename_by_stream(stream, filename_xls, filename_xlsx)
    content_disposition = stream.meta['content-disposition']
    if content_disposition.end_with?('.xls')
      filename_xls
    else
      filename_xlsx
    end
  end
end
