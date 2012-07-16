# -*- encoding: utf-8 -*-
require File.expand_path('../lib/weibo_2/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["simsicon"]
  gem.email         = ["simsicon@gmail.com"]
  gem.description   = "A oauth2 gem for weibo"
  gem.summary       = "A oauth2 gem for weibo"
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "weibo_2"
  gem.require_paths = ["lib"]
  gem.version       = WeiboOAuth2::VERSION
  
  gem.add_development_dependency "rspec", "~> 2.6"
  
  gem.add_runtime_dependency 'oauth2', "~> 0.8.0"
  gem.add_runtime_dependency 'hashie', "~> 1.2.0"
  gem.add_runtime_dependency 'json'  , "~> 1.7.3"
  gem.add_runtime_dependency 'rest-client', "~> 1.6.7"
end
