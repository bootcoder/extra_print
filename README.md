<h1 align='center'>extra_print</h1>
<p align='center'><img src="https://media.giphy.com/media/UCqJOcLU3OGoE/giphy.gif" /></p>

#### When I was first starting out [supertopher](https://www.github.com/supertopher) told me everyday to *p all the things!*

#### As engineers we should always be growing our knowledge set and evolving our practices.

#### Now I *pe* all the things!

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

- ```pe```
- ```pea```

Require the gem in a specific file or application wide.

```ruby
irb(main):002:0> require 'extra_print'
```

## Description && History

__extra_print__ is a simple Ruby Gem designed to highlight variable inspection and make locating specific lines of output in the terminal easier. This is achieved by wrapping a given variable in bright arrows, or by displaying a line of emojis to act as a standalone line break.

__extra_print__ was built with all ruby devs in mind. From the JR just starting out up through DHH & Matz. Hopefully this gem helps build a healthy habit around verifying the evaluation of your code instead of making false assumptions around a programs state. That said, I've been programming for some time and I love highly visible debugging statements so....... maybe something about geese and ganders fits here.

__extra_print__ owes its roots to an idea originally put together by Dev Bootcamp grad Shawn Watson with his [attn_rubygem](https://github.com/its-swats/attn_rubygem).

Note: This gem was designed on a terminal with a black background. I personally feel everybody should be rolling a black b/g because everyone should be using iTerm but I get it, people have preferences that differ from my own. Really I'm just putting this here to say that if it doesn't look as good on your white b/g,,, sorry. (Also, open a PR :-)

## Examples

Each of these examples assumes the following local variable is defined.
```ruby
arr_var = [1,"two", {three: "3"}, :four, :false]
```

### pe(var) -- Variable Display

#### Have you ever done this?

```ruby
p "*" * 30
p "arr_var: #{arr_var}"
p "*" * 30
```

With extra_print simply pass a variable as the first argument to see it displayed like this

```ruby
pe(arr_var)
```

<img src="https://www.dropbox.com/s/304tsssjyqb7y5c/ep.png?raw=1" />

The header will show the class, length (if applicable) and from what line the method was called.
The footer will show either FINISH or a custom message

Each ```pe``` or ```pea``` call wraps your variable with different random colors. Within each call the header and footer will always be the same color.

### pe(var, 'msg') -- Variable Display with footer message

Specify a message as a second argument (string) to be displayed in the footer. Easily identifying multiple extra_print calls.

```ruby
pe(arr_var, 'custom msg 4 debugging')
```

<img src="https://www.dropbox.com/s/jdea6amjrb2kq4q/pe_with_msg.png?raw=1" />

### pea -- Awesome Variable Display

Call ```pea``` instead of ```pe``` for extra awesome print! This displays your variable using awesome_print. All above functionality works exactly the same.

Personally, I always use ```pea``` because I LOVE awesome_print!

```ruby
pea(arr_var, 'second array var')
```

<img src="https://www.dropbox.com/s/uv041yv2timjrnt/eap_with_msg.png?raw=1" />

### pe -- Line Break

#### Have you ever done this?

```ruby
p "*" * 80
```

Don't be that dev. Use extra print to quickly insert a visual break into your output.

Call either method without any arguments to insert a random emoji line. Call it once or multiple times. Each call will use a random emoji. Note: Currently, uniqueness is not  guaranteed in this respect.

```ruby
pe
# OR
pea
```

<img src="https://www.dropbox.com/s/355n4xmezra9wt1/line_break.png?raw=1" />

#### B-E-EFFICIENT

This first Ruby print statement is inefficient for three reasons:

- At an absolute bare minimum this is 10 keystrokes, usually more.
- Depending on the size of your console it could still take a long time to track down as the stars can blend into massive output.
- If you have multiple such print statements, you'll have no way of identifying which is which, you can change the symbol you print but then you're just going to be doing a lot of back and forth, 'Did I put the * here, or was it the &, or the #...'


Addressing these inefficiencies, extra_prints ```pe``` gives you.

- 2 keystrokes to insert a break.
- Highly visual break with a distinct color to differentiate from console clutter.
- Each ```pe``` statement includes its callers location, making console to code sync a cinch.

Speaking of efficiency... There is no difference between the ```pe``` and ```pea``` when called without an argument, so just use ```pe``` and save the keystroke.

This can be incredibly helpful when you need to know if you made it to a particular line of code, like say inside some conditional. A standard p statement gets lost in 1000 lines of server logs but an extra_print statement stands out.

### Return Values

Both ```pe``` & ```pea``` share return values for the following cases:

- ```nil``` - IF no argument is passed
- ```nil``` - IF executing extra_print in a REPL or console.
- ```variable``` - IF one or more arguments are passed, return the first argument

This way you can throw an ```pe``` in front of a returned variable at the end of a function without disrupting the existing flow or needing a spearate return statement after your inspection ala awesome_print.

extra_print also has enviroment dependant return values.

- ```nil``` - IF called from pry
- ```nil``` - IF called from irb
- ```nil``` - IF called from Rails Console

## Legacy Code
OG extra_print users can still use ```ep``` and ```eap```. These calls will continue to be supported through all future releases.

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
* 03/28/2018 - modify return value for REPL execution
* 04/25/2018 - ep / eap => pe / pea - fix return val bug in Rails server
