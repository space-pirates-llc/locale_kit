require 'rails/generators/rails/controller/controller_generator'
require 'rails/generators/rails/scaffold_controller/scaffold_controller_generator'

module Rails
  module Generators
    class ControllerGenerator
      hook_for :locale_kit, as: :controller, type: :boolean, default: true
    end

    class ScaffoldControllerGenerator
      hook_for :locale_kit, as: :controller, type: :boolean, default: true do |invoked|
        invoke invoked, [controller_name]
      end
    end
  end
end
