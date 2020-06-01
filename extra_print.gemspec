Gem::Specification.new do |s|
  s.name        = 'extra_print'
  s.version     = '2.1.0'
  s.date        = '2018-04-25'
  s.summary     = "Easily spot variables printed in a busy console."
  s.description = "Debugging Companion: Informative variable inspection || visual breaks."
  s.authors     = ["Hunter T. Chapman"]
  s.email       = 'bootcoder@gmail.com'
  s.files       = ["lib/extra_print.rb"]
  s.homepage    = 'https://github.com/bootcoder/extra_print'
  s.license     = 'MIT'
  s.add_runtime_dependency 'amazing_print', '~> 1.1', '>= 1.1.0'
end
