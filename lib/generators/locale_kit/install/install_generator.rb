require 'generators/locale_kit'

class LocaleKit::Generators::InstallGenerator < ::Rails::Generators::Base
  source_root File.expand_path('templates', __dir__)

  def create_locale_dir
    empty_directory(locale_dir)
  end

  def copy_example_locale_file
    I18n.available_locales.each do |locale|
      self.current_locale = locale
      template('app.yml', locale_dir.join("#{locale}.yml"))
    end
  end

  private

  attr_accessor :current_locale

  def locale_dir
    Pathname.new(LocaleKit.config.directory)
  end

  def app_name
    Rails.application.class.parent_name.underscore
  end
end
