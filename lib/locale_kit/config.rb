require 'singleton'

class LocaleKit::Config
  include Singleton

  def directory
    @directory ||= File.join('app', 'locales')
  end
  attr_writer :directory

  def logger
    @logger ||= Rails.logger
  end
  attr_writer :logger
end
