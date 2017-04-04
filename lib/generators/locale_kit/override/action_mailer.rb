require 'rails/generators/mailer/mailer_generator'

module Rails
  module Generators
    class MailerGenerator
      hook_for :locale_kit, as: :mailer, type: :boolean, default: true
    end
  end
end
