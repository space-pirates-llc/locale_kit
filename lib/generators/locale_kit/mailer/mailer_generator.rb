require 'generators/locale_kit'

class LocaleKit::Generators::MailerGenerator < LocaleKit::Generators::Base
  source_root File.expand_path('templates', __dir__)

  argument(:actions, type: :array, default: [], banner: 'method method')

  def copy_example_locale_file
    I18n.available_locales.each do |locale|
      self.current_locale = locale
      template('locale.yml', locale_dir.join('mailers', *class_path, file_name, "#{locale}.yml"))
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
