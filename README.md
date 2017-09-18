# extra_print
### a gem to catch the eye

_extra_print_ is a simple Ruby Gem designed to make locating specific lines of output in the terminal easier. This is achieved by inserting headers and footers around a given variable, or by displaying a line of emojis to act as a standalone line break. Extra print is a fork of an idea originally put together by Shawn Watson with [attn_rubygem](https://github.com/its-swats/attn_rubygem).

## Installation
```
dev :> gem install extra_print
```

## Usage
It's as simple as requiring the gem in your project. Once required, extra_print has 2 modes, and a handful of colorization options.

Require the gem in your file
```ruby
irb(main):002:0> require 'extra_print'
```

### Line Break

Call the method without any arguments to insert a line of random emojis
```ruby
irb(main):002:0> ep
🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟
```

### Variable Display

Pass a variable as the first argument to see it displayed like this

```ruby
irb(main):008:0> ep(Variable_to_highlight)
⬇ ⬇ ⬇ ⬇ ⬇  CLASS: Array LENGTH: 3 CALLER: sandbox.rb:26:in `<main>' ⬇ ⬇ ⬇ ⬇ ⬇

"Variable_to_highlight"

⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆  FINISH ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆
```

### Variable Display with message

You can also specify a message as a second argument (string) to be displayed in the footer. Easily identifying multiple extra_print calls.

```ruby

irb(main):010:0> ep(Variable_to_highlight, 'thing from that place')
⬇ ⬇ ⬇ ⬇ ⬇  CLASS: Array LENGTH: 3 CALLER: sandbox.rb:26:in `<main>' ⬇ ⬇ ⬇ ⬇ ⬇

"Variable_to_highlight"

⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ thing from that place ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆
```

## Contributing
1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## History

* 9/16/2017 - initial release

