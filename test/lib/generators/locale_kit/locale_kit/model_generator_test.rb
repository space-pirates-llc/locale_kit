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
    end
  end
end
