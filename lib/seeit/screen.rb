require 'pathname'
require "webshot"
require 'webshot/screenshot'

module Seeit
  class Screenshot
    def initialize(url, name, path = nil)

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
      ws = Webshot::Screenshot.instance
      ws.capture(@_url, "#{@_path}/#{@_name}.png", width: 4096) do |magick|
        magick.combine_options do |c|
        end
      end
    end
  end
end
