# coding: utf-8

Gem::Specification.new do |s|
  s.name        = 'twitch-api-client'
  s.version     = '0.1.0'
  s.date        = '2017-07-20'
  s.summary     = 'Twitch.tv API client'
  s.description = 'Twitch.tv API client'
  s.authors     = ['Christoffer Artmann']
  s.email       = 'Artgaard@gmail.com'
  s.files       = ['lib/twitch-api-client.rb']
  s.homepage    = 'http://rubygems.org/gems/twitch-api-client'
  s.license     = 'MIT'
  s.add_runtime_dependency 'httparty', '>= 0.15.5'
  s.add_development_dependency 'rspec', ['>= 3.6.0']
end