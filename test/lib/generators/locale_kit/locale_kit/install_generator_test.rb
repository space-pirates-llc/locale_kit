require 'test_helper'
require 'generators/locale_kit/install/install_generator'

module LocaleKit
  class LocaleKit::Generators::InstallGeneratorTest < Rails::Generators::TestCase
    tests LocaleKit::Generators::InstallGenerator
    destination Rails.root.join('tmp', 'generators', 'install')
    setup :prepare_destination

    test 'generator runs without errors' do
      run_generator
      assert_file 'app/locales/ja.yml'
    end
  end
end
