require 'test_helper'
require 'generators/locale_kit/model/model_generator'

module LocaleKit
  class LocaleKit::Generators::ModelGeneratorTest < Rails::Generators::TestCase
    tests LocaleKit::Generators::ModelGenerator
    destination Rails.root.join('tmp', 'generators', 'model')
    setup :prepare_destination

    test 'generator runs without errors' do
      run_generator ['User']
      assert_file 'app/locales/models/user/ja.yml'

      path = destination_root.join('app/locales/models/user/ja.yml')
      content = File.read(path)

      assert_includes(content, "ja:\n  activerecord:")
    end

    test 'generator runs with custom scope' do
      ApplicationRecord.i18n_scope = :minitest

      run_generator ['User']
      assert_file 'app/locales/models/user/ja.yml'

      ApplicationRecord.i18n_scope = nil

      path = destination_root.join('app/locales/models/user/ja.yml')
      content = File.read(path)

      assert_includes(content, "ja:\n  minitest:")

    end
  end
end
