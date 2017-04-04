require 'test_helper'
require 'generators/locale_kit/controller/controller_generator'

module LocaleKit
  class LocaleKit::Generators::ControllerGeneratorTest < Rails::Generators::TestCase
    tests LocaleKit::Generators::ControllerGenerator
    destination Rails.root.join('tmp', 'generators')
    setup :prepare_destination

    test 'generator runs without errors' do
      assert_nothing_raised do
        run_generator ['Root']
      end
    end
  end
end
