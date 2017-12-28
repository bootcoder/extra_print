# extra_print

<img src="https://media.giphy.com/media/UCqJOcLU3OGoE/giphy.gif" />

### ```p``` all the things
### or in this case ```ep``` all the things!

__extra_print__ is a simple Ruby Gem designed to make locating specific lines of output in the terminal easier. This is achieved by inserting informative headers and footers around a given variable, or by displaying a line of emojis to act as a standalone line break.

__extra_print__ was built with JR web developers in mind. Hopefully this gem helps build a healthy habit around verifying the evaluation of your code instead of frequently making false assumptions around a programs state. That said, I've been programming for some time and I love highly visible debugging statements so....... maybe something about geese and ganders fits here.

__extra_print__ is a fork of an idea originally put together by Dev Bootcamp grad Shawn Watson with his [attn_rubygem](https://github.com/its-swats/attn_rubygem).

Note: This gem was designed on a terminal with a black background. I personally feel everybody should be rolling a black b/g because everyone should be using iTerm but I get it, people have preferences that differ from my own. Really I'm just putting this here to say that if it doesn't look as good on your white b/g,,, sorry. (Also open a PR :-)

## Installation

```bash
dev :> gem install extra_print
```

Or if including in a project

```ruby
# Gemfile
gem 'extra_print'
```

## Usage

It's as simple as requiring the gem in your project. Once required, extra_print has two public methods.

- ```ep```
- ```eap```

Require the gem in a specific file or application wide.

```ruby
irb(main):002:0> require 'extra_print'
```

## Examples

Each of these examples assumes the following local variable is defined.
```ruby
arr_variable = [1,"two", {three: "3"}, :four, :false]
```

### ep(var) -- Variable Display

Pass a variable as the first argument to see it displayed like this

```ruby
ep(arr_variable)
```

<img src="https://www.dropbox.com/s/304tsssjyqb7y5c/ep.png?raw=1" />

The header will show the class, length (if applicable) and from what line the method was called.
The footer will show either FINISH or a custom message

Each ```ep``` or ```eap``` call wraps your variable with different random colors. Within each call the header and footer will always be the same color.

### ep(var, msg) -- Variable Display with footer message

Specify a message as a second argument (string) to be displayed in the footer. Easily identifying multiple extra_print calls.

```ruby
ep(arr_variable, 'custom msg 4 debugging')
```

<img src="https://www.dropbox.com/s/jdea6amjrb2kq4q/ep_with_msg.png?raw=1" />

### eap -- Awesome Variable Display

Call ```eap``` instead of ```ep``` for __EXTRA AWESOME PRINT__ to display your variable using awesome_print. All above functionality works exactly the same.

```ruby
eap(arr_variable, 'second array var')
```

<img src="https://www.dropbox.com/s/uv041yv2timjrnt/eap_with_msg.png?raw=1" />

### ep -- Line Break

Call either method without any arguments to insert a line of random emojis. Call it once or multiple times.

```ruby
ep
# OR
eap
```

<img src="https://www.dropbox.com/s/355n4xmezra9wt1/line_break.png?raw=1" />

This can be incredibly helpful when you need to know if you made it to a particular line of code, like say inside some conditional. A standard p statement gets lost in 1000 lines of server logs but an extra_print statement stands out.

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## History

* 9/16/2017 - initial release
* 9/19/2017 - refactor caller - add to line break
* 12/27/2017 - add / correct nil variable output
