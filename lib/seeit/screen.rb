require 'pathname'
require "capybara/dsl"
require "capybara/poltergeist"

module Seeit
  class Screenshot
    include Capybara::DSL
    def initialize(save_path)

      @browser_width = 1024
      @browser_height = 768

      Capybara.run_server = false
      Capybara.register_driver :poltergeist do |app|
        Capybara::Poltergeist::Driver.new(app, {
          timeout: 180,
          # Raise JavaScript errors to Ruby
          js_errors: false,
          # Additional command line options for PhantomJS
          phantomjs_options: ['--ignore-ssl-errors=yes', '--ssl-protocol=any']
        })
      end
      Capybara.current_driver = :poltergeist

      #@_url     = url
      #@_name    = name
      @_path    = save_path
    end

    def resize_width(width = nil)
      _width = @browser_width
      _width = width unless width.nil?
      page.driver.resize(_width, @browser_height)
    end

    def open_url(url = nil)
      @_url = url unless url.nil?
      visit @_url
    end

    def snap(name = nil)
      @_name = name unless name.nil?
      take_screenshot
    end

    private

    def take_screenshot()
      output_path = File.join @_path, "#{@_name}.png"
      save_screenshot(output_path, {full: true, gravity: 'north'})
    end
  end
end
