$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'locale_kit/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'locale_kit'
  s.version     = LocaleKit::VERSION
  s.authors     = ['Sho Kusano']
  s.email       = ['sho-kusano@space-pirates.jp']
  s.homepage    = 'https://github.com/space-pirates-llc/locale_kit'
  s.summary     = 'Improve locales convention of Rails'
  s.description = s.summary
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'i18n'
  s.add_dependency 'rails', '>= 5.0.2'

  s.add_development_dependency 'coveralls'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
end
