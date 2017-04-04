require 'rails/generators/active_record/model/model_generator'

module ActiveRecord
  module Generators
    class ModelGenerator
      hook_for :locale_kit, as: :model, type: :boolean, default: true
    end
  end
end
