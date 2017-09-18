# extra_print

### ```p``` all the things
### or in this case ```ep``` all the things!

_extra_print_ is a simple Ruby Gem designed to make locating specific lines of output in the terminal easier. This is achieved by inserting informative headers and footers around a given variable, or by displaying a line of emojis to act as a standalone line break.

Extra print was built with JR web developers in mind. Hopefully this gem helps build a healthy habit around verifying the evaluation of your code instead of frequently making false assumptions around a programs state. That said, I've been programming for some time and I love highly visible debugging statements so....... maybe something about geese and ganders fit here.

Extra print is a fork of an idea originally put together by Dev Bootcamp grad Shawn Watson with his [attn_rubygem](https://github.com/its-swats/attn_rubygem).

This gem was designed on a terminal with a black background. I personally feel everybody should be rolling a black b/g but I get it, people have preferences that differ from my own. Really I'm just putting this here to say that if it doesn't look as good on your white b/g,,, sorry. (Also open a PR :-)

## Installation

```bash
dev :> gem install extra_print
```

## Usage

It's as simple as requiring the gem in your project. Once required, extra_print has two public methods.

- ep
- eap

Require the gem in your file
```ruby
irb(main):002:0> require 'extra_print'
```

### Variable Display

Pass a variable as the first argument to see it displayed like this

```ruby
irb(main):008:0> ep(Variable_to_highlight)
⬇ ⬇ ⬇ ⬇ ⬇  CLASS: Array LENGTH: 3 CALLER: sandbox.rb:26:in `<main>' ⬇ ⬇ ⬇ ⬇ ⬇

"Variable_to_highlight"

⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆  FINISH ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆
```

The header will show the class, length (if applicable) and from what line the method was called.
The footer will show either FINISH or a custom message

Each ep or eap call wraps your variable with different random colors. Within each call the header and footer will always be the same color.

### Variable Display with footer message

Specify a message as a second argument (string) to be displayed in the footer. Easily identifying multiple extra_print calls.

```ruby
irb(main):010:0> ep(Variable_to_highlight, 'thing from that place')
⬇ ⬇ ⬇ ⬇ ⬇  CLASS: Array LENGTH: 3 CALLER: sandbox.rb:26:in `<main>' ⬇ ⬇ ⬇ ⬇ ⬇

"Variable_to_highlight"

⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ thing from that place ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆
```

### Line Break

Call either method without any arguments to insert a line of random emojis
```ruby
irb(main):002:0> ep
🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟  🌟
```

This can be incredibly helpful when you need to know if you made it to a particular line of code, like say inside some conditional. A standard p statement gets lost in 1000 lines of server logs but an extra_print statement stands out.

### Awesome Variable Display

Call ```eap``` instead of ```ep``` for __EXTRA AWESOME PRINT__ to display your variable using awesome_print. All above functionality works exactly the same.

```ruby
irb(main):010:0> eap(some_hash_variable, 'some hash')

⬇ ⬇ ⬇ ⬇ ⬇  CLASS: Hash LENGTH: 1 CALLER: sandbox.rb:30:in `<main>' ⬇ ⬇ ⬇ ⬇ ⬇

{
    :thing => "stuff"
}

⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆  some hash ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆ ⬆
```

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## History

* 9/16/2017 - initial release
