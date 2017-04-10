# frozen_string_literal: true

Rails.application.routes.draw do
  get 'static/hello'

  mount LocaleKit::Engine => '/locale_kit'

  root to: 'static#hello'
end
