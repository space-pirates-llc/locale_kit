require 'rails/generators/named_base'

module LocaleKit
  module Generators
    class Base < ::Rails::Generators::NamedBase
      private

      def locale_dir
        Pathname.new(LocaleKit.config.directory)
      end
    end
  end
end
