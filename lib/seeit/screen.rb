require 'pathname'
require "webshot"
require 'webshot/screenshot'

module Seeit
  class Screenshot
    def initialize(url, name, path = nil, width = 1024)
      @width = 1024

      # if path is nil, then default to current
      _path = path
      if _path.nil?
        _path = Pathname.new(File.dirname(__FILE__))
      end

      @_url     = url
      @_name    = name
      @_path    = _path
      # self.snap
    end

    def snap
      Webshot.width = @width
      ws = Webshot::Screenshot.instance
      ws.capture(@_url, "#{@_path}/#{@_name}.png") do |magick|
        magick.combine_options do |c|
        end
      end
    end
  end
end
