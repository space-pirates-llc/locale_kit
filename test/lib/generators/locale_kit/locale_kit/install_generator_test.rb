require 'test_helper'
require 'generators/locale_kit/install/install_generator'

module LocaleKit
  class LocaleKit::Generators::InstallGeneratorTest < Rails::Generators::TestCase
    tests LocaleKit::Generators::InstallGenerator
    destination Rails.root.join('tmp', 'generators')
    setup :prepare_destination

    test 'generator runs without errors' do
      assert_nothing_raised do
        run_generator
      end
    end
  end
end
