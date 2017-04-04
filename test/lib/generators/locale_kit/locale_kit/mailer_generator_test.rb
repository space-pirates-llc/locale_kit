require 'test_helper'
require 'generators/locale_kit/mailer/mailer_generator'

module LocaleKit
  class LocaleKit::Generators::MailerGeneratorTest < Rails::Generators::TestCase
    tests LocaleKit::Generators::MailerGenerator
    destination Rails.root.join('tmp', 'generators')
    setup :prepare_destination

    test 'generator runs without errors' do
      assert_nothing_raised do
        run_generator ['Example']
      end
    end
  end
end
