require 'test_helper'
require 'generators/locale_kit/controller/controller_generator'

module LocaleKit
  class LocaleKit::Generators::ControllerGeneratorTest < Rails::Generators::TestCase
    tests LocaleKit::Generators::ControllerGenerator
    destination Rails.root.join('tmp', 'generators', 'controller')
    setup :prepare_destination

    test 'generator runs without errors' do
      run_generator ['Root']
      assert_file 'app/locales/controllers/root/ja.yml'
      assert_file 'app/locales/views/root/ja.yml'
    end
  end
end
