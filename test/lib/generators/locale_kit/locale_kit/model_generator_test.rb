require 'test_helper'
require 'generators/locale_kit/model/model_generator'

module LocaleKit
  class LocaleKit::Generators::ModelGeneratorTest < Rails::Generators::TestCase
    tests LocaleKit::Generators::ModelGenerator
    destination Rails.root.join('tmp', 'generators')
    setup :prepare_destination

    test 'generator runs without errors' do
      assert_nothing_raised do
        run_generator ['User']
      end
    end
  end
end
