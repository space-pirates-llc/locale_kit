# frozen_string_literal: true
class LocaleKit::Engine < ::Rails::Engine
  isolate_namespace LocaleKit

  config.locale_kit = LocaleKit.config

  generators do |app|
    Rails::Generators.configure!(app.config.generators)
    require 'generators/locale_kit/override/action_controller' if defined?(ActionController)
    require 'generators/locale_kit/override/active_record' if defined?(ActiveRecord)
    require 'generators/locale_kit/override/action_mailer' if defined?(ActionMailer)
  end

  config.to_prepare do
    LocaleKit.reload!
  end
end
