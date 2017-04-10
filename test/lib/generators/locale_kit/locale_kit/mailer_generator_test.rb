require 'test_helper'
require 'generators/locale_kit/mailer/mailer_generator'

module LocaleKit
  class LocaleKit::Generators::MailerGeneratorTest < Rails::Generators::TestCase
    tests LocaleKit::Generators::MailerGenerator
    destination Rails.root.join('tmp', 'generators', 'mailer')
    setup :prepare_destination

    test 'generator runs without errors' do
      run_generator ['Example']
      assert_file 'app/locales/mailers/example/ja.yml'
    end
  end
end
