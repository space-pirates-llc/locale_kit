# frozen_string_literal: true

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

  def reload
    return @reload if instance_variable_defined?(:@reload)

    @reload = Rails.env.development?
  end
  attr_writer :reload

  def verbose
    return @verbose if instance_variable_defined?(:@verbose)

    @verbose = Rails.env.development?
  end
  attr_writer :verbose
end
