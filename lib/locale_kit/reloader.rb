# frozen_string_literal: true

class LocaleKit::Reloader
  def initialize(app)
    @app = app
  end

  def call(env)
    LocaleKit.reload!

    @app.call(env)
  end
end
