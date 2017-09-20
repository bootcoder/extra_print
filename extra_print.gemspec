Gem::Specification.new do |s|
  s.name        = 'extra_print'
  s.version     = '1.1.0'
  s.date        = '2017-09-19'
  s.summary     = "Easily spot variables printed in a busy console."
  s.description = "Simple gem to display variables and visual breaks."
  s.authors     = ["Hunter Chapman"]
  s.email       = 'bootcoder@gmail.com'
  s.files       = ["lib/extra_print.rb"]
  s.homepage    = 'http://rubygems.org/gems/extra_print'
  s.license       = 'MIT'
  s.add_runtime_dependency 'awesome_print', '~> 1.8', '>= 1.8.0'
end
