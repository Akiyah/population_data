require 'open-uri'

class Downloader
  def initialize(path)
    @path = path
  end

  def download(name, url)
    filename_xls = "%s/%s.xls" % [@path, name]
    filename_xlsx = "%s/%s.xlsx" % [@path, name]

    return filename_xls if File.exist?(filename_xls)
    return filename_xlsx if File.exist?(filename_xlsx)

    URI.open(url) do |stream|
      content_disposition = stream.meta["content-disposition"]
      filename = if content_disposition.end_with?('.xls')
        filename_xls
      else
        filename_xlsx
      end
      puts "download: #{filename}"
      open(filename, 'w+b') do |file|
        file.write(stream.read)
      end
      filename
    end
  end
end
