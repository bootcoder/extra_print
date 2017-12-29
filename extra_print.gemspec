Gem::Specification.new do |s|
  s.name        = 'extra_print'
  s.version     = '1.1.5'
  s.date        = '2017-12-29'
  s.summary     = "Easily spot variables printed in a busy console."
  s.description = "Debugging Companion: Informative variable wrappers || visual breaks."
  s.authors     = ["Hunter T. Chapman"]
  s.email       = 'bootcoder@gmail.com'
  s.files       = ["lib/extra_print.rb"]
  s.homepage    = 'https://github.com/bootcoder/extra_print'
  s.license       = 'MIT'
  s.add_runtime_dependency 'awesome_print', '~> 1.8', '>= 1.8.0'
end
