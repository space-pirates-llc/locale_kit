# frozen_string_literal: true

require 'locale_kit/reloader'

class LocaleKit::Engine < ::Rails::Engine
  isolate_namespace LocaleKit

  generators do |app|
    Rails::Generators.configure!(app.config.generators)
    require 'generators/locale_kit/override/action_controller' if defined?(ActionController)
    require 'generators/locale_kit/override/active_record' if defined?(ActiveRecord)
    require 'generators/locale_kit/override/action_mailer' if defined?(ActionMailer)
  end

  config.locale_kit = LocaleKit.config

  initializer 'locale_kit.setup_action_controller' do
    ActiveSupport.on_load :action_controller do
      instance_eval do
        use(LocaleKit::Reloader) if LocaleKit.config.reload
      end
    end
  end

  config.after_initialize do |_app|
    LocaleKit.reload!
  end
end
