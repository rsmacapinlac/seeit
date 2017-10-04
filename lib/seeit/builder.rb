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
      @screenshot = Seeit::Screenshot.new(project_folder)

      @site_configuration_file  = "#{@project_folder}/settings.json"
      read_settings(@site_configuration_file)

      @build_version_marker = build_version_marker
      @build_version_marker = Date.today.strftime("%Y-%m-%d") if build_version_marker.nil?
    end

    def build
      create_build_version_directory
      pages   = @site_config['structure']
      widths  = @site_config['widths']
      widths  = [] if @site_config['widths'].nil?

      for page in pages
        page_name = page.keys[0]
        page_url  = page[page_name]

        @screenshot.open_url page_url

        if widths.empty?
          file_path = File.join @build_version_marker, page_name
          @screenshot.snap file_path
        else
          for width in widths
            profile_name = width.keys[0]
            profile_size = width[profile_name]
            @screenshot.resize_width profile_size
            file_path = File.join @build_version_marker, "#{page_name} - #{profile_name}"
            @screenshot.snap file_path
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
