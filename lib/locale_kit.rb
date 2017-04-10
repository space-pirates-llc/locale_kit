# frozen_string_literal: true

require 'locale_kit/version'
require 'locale_kit/config'

module LocaleKit
  def app
    Rails.application
  end
  module_function :app

  def config
    @config ||= LocaleKit::Config.instance
  end
  module_function :config

  def locales
    Dir[app.root.join(config.directory, '**', '*.{yml,rb}')]
  end
  module_function :locales

  def reload!
    I18n.load_path = (I18n.load_path + locales).uniq
    I18n.backend.reload!

    config.logger.try(:info, 'Reloaded locales by LocaleKit')
  end
  module_function :reload!
end

require 'locale_kit/engine' if defined?(Rails)
