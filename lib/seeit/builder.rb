require 'fileutils'
require 'json'

module Seeit
  class ConfigFileNotFound < StandardError
    def initialize(msg = "settings.json File not found")
      super(msg)
    end
  end

  class Builder
    def initialize(project_folder, build_version_marker = nil)
      @project_folder = File.expand_path project_folder

      @site_configuration_file  = "#{@project_folder}/settings.json"
      read_settings(@site_configuration_file)

      @build_version_marker = build_version_marker
      @build_version_marker = Date.today.strftime("%Y-%m-%d") if build_version_marker.nil?
    end

    def build
      create_build_version_directory
      pages   = @site_config['structure']
      widths  = @site_config['widths']
      widths   = [] if @site_config['widths'].nil?
      for page in pages
        if widths.empty?
          page.each { |key, value|
            a = Seeit::Screenshot.new value, key, build_version_directory
            a.snap
          }
        else
          for width in widths
            width_name  = ''
            width_value = ''
            width.each { |key, value|
              width_name = key
              width_value = value
            }
            page.each { |key, value|
              a = Seeit::Screenshot.new value, "#{key} - #{width_name}", build_version_directory, width_value
              a.snap
            }
          end
        end
      end
    end

    private

    def build_version_directory
      "#{@project_folder}/#{@build_version_marker}"
    end

    def read_settings(config_file)
      unless File.exists? config_file
        raise ConfigFileNotFound.new
      end
      _file = File.read config_file
      @site_config = JSON.parse _file
    end

    def create_build_version_directory
      unless File.exists? build_version_directory
        FileUtils::mkdir_p build_version_directory
      end
    end
  end
end
