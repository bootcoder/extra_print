$COLORS = {'red' => '031','green' => '032','yellow' => '033','blue' => '094','magenta' => '035','cyan' => '036', 'gray' => '037', 'light_red' => '091', 'light_green' => '092', 'light_magenta' => '095', 'light_cyan' => '096'}
$EMOJIS = %w"😎 😈 👹 👺 👻 👿 💀 👽 😂 🤣 🎃 🐶 🦊 ⭐ 🌟 🏈 🏀 ⚽ ⛔ ♻️ ❓ 💽 🎁 🌠 🥓 🥑 🥦 🍤 🍗 🍖 🍕 🍰 🥃 💰 🍦 🍭 🤯 🤬 🐞 💛 💚 💙 💜"

#### DEBUGGING gems ####
# require 'amazing_print'
# require 'pry-byebug'
########################


# Using ANSI color coding to spruce things up
# SYNTAX: \033[COLOR_CODEmINNER_TEXT\033[0m
# There are cleaner ways of doing the color manipulation
# But this approach avoids extra dependencies, which is better :-)

# Simply call pe or pea (extra_amazing_print) and pass a variable you want to inspect.
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

def extra_print(variable = nil, msg = nil, add_amazing_print = false)
  # Set variables
  @msg      = msg
  @variable = variable
  set_colors
  # Build upper, center, lower sections
  display_detail_bar(true)
  display_variable(add_amazing_print)
  @msg ? display_msg_footer : display_detail_bar(false)
end

def set_colors
  # No red/green if calling from a spec
  @secondary_color = '092'
  if $0.split('.').last[/spec|test/]
    $COLORS.delete('red')
    $COLORS.delete('light_red')
    $COLORS.delete('light_green')
    $COLORS.delete('green')
  end
  @color = $COLORS.values.sample
  # If primary color passed is GREEN set secondary color to RED
  @secondary_color = '031' if @color == '092'
  @secondary_color = '031' if @color == '032'
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

def display_variable(add_amazing_print)
  proc = Proc.new { @variable }
  if add_amazing_print
    require 'amazing_print'
    AmazingPrint.defaults = {
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
def display_msg_footer
  str = "\033[#{@color}m⬆ " * ((@length / 4) - (@msg.length / 2) - 1)
  str += "\033[#{@secondary_color}m #{@msg} "
  str += "\033[#{@color}m⬆ \033[0m" * ((@length / 4))
  puts str
end

def display_detail_bar(top_bar = true)
  arrow = top_bar ? "⬇" : "⬆"

  # Initial arrows with a new line padding the top
  str = ""
  str += "\033[#{@color}m#{arrow} \033[m" * 5

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
  str += "\033[#{@color}m#{arrow} \033[m" * 5

  # Output completed string
  puts if top_bar # add single line of top padding to eap output
  puts str

  # Set @length - non encoded string for use in footer
  @length = str.gsub(/\e\[\d{3}m/, '').gsub(/\e\[m/, '').length
end
