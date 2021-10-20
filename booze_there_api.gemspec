# frozen_string_literal: true

require './lib/booze_there_api/version'

Gem::Specification.new do |spec|
  spec.name = 'booze_there_api'
  spec.version        = BoozeThereAPI::VERSION
  spec.authors        = %w[Logan Stucker]
  spec.email = ['stuck124@umn.edu']

  spec.summary        = 'Booze There API'
  spec.description    = 'API to interact with the data used in Booze There'
  spec.homepage       = 'https://github.com/lfstucker/BoozeThereAPI'
  spec.license        = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>=2.7')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/lfstucker/BoozeThereAPI'
  spec.metadata['changelog_uri'] = 'https://github.com/lfstucker/BoozeThereAPI'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(/^(test|spec|features)/) }
  end

  spec.require_paths = ['lib']

  spec.add_dependency 'concurrent-ruby'
  spec.add_dependency 'concurrent-ruby-ext'
  spec.add_dependency 'faraday'
  spec.add_dependency 'faraday_middleware'
  spec.add_dependency 'oj'
  spec.add_dependency 'pg'
  spec.add_dependency 'sequel'
  spec.add_dependency 'sinatra'
  spec.add_dependency 'sinatra-contrib'
  spec.add_dependency 'thor'
  spec.add_dependency 'uri'

  spec.add_development_dependency 'puma'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec_junit_formatter'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'simplecov'
end
