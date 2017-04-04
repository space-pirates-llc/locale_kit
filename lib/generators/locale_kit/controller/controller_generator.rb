require 'generators/locale_kit'

class LocaleKit::Generators::ControllerGenerator < LocaleKit::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  argument(:actions, type: :array, default: [], banner: 'action action')

  def copy_example_locale_file
    I18n.available_locales.each do |locale|
      self.current_locale = locale
      template('controller.yml', locale_dir.join('controllers', *class_path, file_name, "#{locale}.yml"))
      template('view.yml', locale_dir.join('views', *class_path, file_name, "#{locale}.yml"))
    end
  end

  private

  attr_accessor :current_locale

  def namespaces
    (class_path + [file_name + '_mailer'])
  end

  def locale_namespace
    namespaces.map.with_index(1) { |name, idx| ('  ' * idx) + name + ':' }.join("\n")
  end

  def action_names
    actions.map(&:to_s)
  end
end
