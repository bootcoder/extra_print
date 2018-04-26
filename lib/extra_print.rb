$COLORS = {'red' => '031','green' => '032','yellow' => '033','blue' => '034','magenta' => '035','cyan' => '036'}
$EMOJIS = %w"😎 😈 👹 👺 👻 👿 💀 👽 😂 🤣 🎃 🐶 🦊 ⭐ 🌟 🏈 🏀 ⚽ ⛔ ♻️ ❓ 💽 🎁 🌠 🥓 🥑 🥦 🍤 🍗 🍖 🍕 🍰 🥃 💰 🍦 🍭 🤯 🤬 🐞 💛 💚 💙 💜"

#### DEBUGGING gems ####
# require 'awesome_print'
# require 'pry-byebug'
########################


# Using ANSI color coding to spruce things up
# SYNTAX: \033[COLOR_CODEmINNER_TEXT\033[0m
# There are cleaner ways of doing the color manipulation
# But this approach avoids extra dependencies, which is better :-)

# Simply call pe or pea (extra_awesome_print) and pass a variable you want to inspect.
# Alternatively, call pe or pea with no arguments to display an emoji line break and calling line info.

def pe(*args)
  @caller_path = caller
  return display_emoji_break if args.empty?
  extra_print(args[0], args[1])
  return_value(args[0])
end

def pea(*args)
  @caller_path = caller
  return display_emoji_break if args.empty?
  extra_print(args[0], args[1], true)
  return_value(args[0])
end

#######################################################################
# NOTE: LEGACY CODE #ep #eap ensure compatibility for future versions #
#######################################################################

def ep(*args)
  @caller_path = caller
  return display_emoji_break if args.empty?
  extra_print(args[0], args[1])
  return_value(args[0])
end

def eap(*args)
  @caller_path = caller
  return display_emoji_break if args.empty?
  extra_print(args[0], args[1], true)
  return_value(args[0])
end

private

def extra_print(variable = nil, msg = nil, add_awesome_print = false)
  # Set variables
  @variable = variable
  @msg = msg ? msg : " FINISH "

  # No red/green if calling from a spec
  if $0.split('.').last[/spec|test/]
    $COLORS.delete('red')
    $COLORS.delete('green')
    @color = $COLORS.values.sample
    @secondary_color = '034'
  else
    @color = $COLORS.values.sample
    # If the color being passed in is RED set secondary color to BLUE
    @secondary_color = @color == '031' ? '034' : '031'
  end

  # View Methods
  display_detail_header
  display_variable(add_awesome_print)
  display_footer
end

# Checks to see if running in a Ruby file
# IF so returns value, enabling ep's from the end of a method without disrupting functionality.
# ELSE returns nil, presuming it is running in a REPL and we don't want to see our output doubled because the REPL prints the return value as well.
def return_value(val)
  return val if defined?(Rails::Server)
  return nil if defined?(Rails::Console)
  return nil if $0.split('.').last.include? 'pry'
  return nil if $0.split('.').last.include? 'irb'
  return val if $0.split('.').last == 'rb'
  val
end

def path_clip
  @caller_path[0].split('/').last(2).join('/').split(':in')[0]
end

def display_variable(add_awesome_print)
  proc = Proc.new { @variable }
  if add_awesome_print
    require 'awesome_print'
    AwesomePrint.defaults = {
      indent: -2, # left aligned
      sort_keys: true, # sort hash keys
    }
    ap @variable
  else
    p proc.call
  end
end

# rando emojis for fun && eye catching line breaks
def display_emoji_break
  emoji = $EMOJIS.sample
  print  "#{emoji}  " * 15
  print " #{path_clip}  "
  puts  "#{emoji}  " * 15
end

# TODO: off by one error on dynamic footer length
def display_footer
  str = "\033[#{@color}m⬆ " * ((@length / 4) - (@msg.length / 2) - 1)
  str += "\033[#{@secondary_color}m #{@msg} "
  str += "\033[#{@color}m⬆ \033[0m" * ((@length / 4))
  puts str
end

def display_detail_header

  # Initial arrows with a new line padding the top
  str = ""
  str += "\033[#{@color}m⬇ \033[m" * 5

  # Variable Class Display
  str += "\033[#{@color}m CLASS:\033[m"
  str += "\033[#{@secondary_color}m #{@variable.class} \033[m"

  # IF variable has a length display it
  if @variable.respond_to?(:length)
    str += "\033[#{@color}mLENGTH:\033[m"
    str += "\033[#{@secondary_color}m #{@variable.length} \033[m"
  end

  # Show where the code was called from last
  str += "\033[#{@color}mCALLER:\033[m"
  str += "\033[#{@secondary_color}m #{path_clip} \033[m"

  # Closing arrows
  str += "\033[#{@color}m⬇ \033[m" * 5

  # Output completed string
  puts
  puts str

  # Set @length - non encoded string for use in footer
  @length = str.gsub(/\e\[\d{3}m/, '').gsub(/\e\[m/, '').length
end
