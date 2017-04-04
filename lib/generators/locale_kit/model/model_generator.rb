require 'generators/locale_kit'

class LocaleKit::Generators::ModelGenerator < LocaleKit::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  argument(:attributes, type: :array, default: [], banner: 'field:type field:type')

  def copy_example_locale_file
    I18n.available_locales.each do |locale|
      self.current_locale = locale
      template('locale.yml', locale_dir.join('models', *class_path, file_name, "#{locale}.yml"))
    end
  end

  private

  attr_accessor :current_locale

  def model_type
    defined?(ActiveRecord) ? :activerecord : :activemodel
  end

  def namespaces
    (class_path + [file_name])
  end

  def locale_namespace
    namespaces.map.with_index(1) { |name, idx| ('  ' * idx) + name + ':' }.join("\n")
  end

  def model_name
    (class_path + [file_name]).join('/')
  end

  def attribute_names
    attributes.map(&:name)
  end
end
