# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true


  def self.i18n_scope
    @i18n_scope || super
  end

  def self.i18n_scope=(scope)
    @i18n_scope = scope
  end
end
