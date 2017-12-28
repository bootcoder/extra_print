$COLORS = {'red' => '031','green' => '032','yellow' => '033','blue' => '034','magenta' => '035','cyan' => '036'}
$EMOJIS = %w"😎 😈 👹 👺 👻 👿 💀 👽 😂 🤣 🎃 🐶 🦊 ⭐ 🌟 🏈 🏀 ⚽ ⛔ ❓ 💽 🎁 🌠 🥓 🍤 🍗 🍖 🍕 🍰 🍦 🍭"

#### DEBUGGING gems ####
# require 'awesome_print'
# require 'pry-byebug'
########################

# Using ANSI color coding to spruce things up
# SYNTAX: \033[COLOR_CODEmINNER_TEXT\033[0m
# There are cleaner ways of doing the color manipulation
# But this approach avoids extra dependencies, which is better :-)

# def eap(variable = nil, msg = nil)
def eap(*args)
  @caller_path = caller
  return display_emoji_break if args.empty?
  extra_print(args[0], args[1], true)
  args[0]
end

def ep(*args)
  @caller_path = caller
  return display_emoji_break if args.empty?
  extra_print(args[0], args[1])
  args[0]
end

private

def extra_print(variable = nil, msg = nil, add_awesome_print = false)
  # Set variables
  @color = $COLORS.values.sample
  @variable = variable
  @msg = msg ? msg : " FINISH "
  # If the color being passed in is RED set secondary color to BLUE
  @secondary_color = @color == '031' ? '034' : '031'

  # View Methods
  display_detail_header
  display_variable(add_awesome_print)
  display_footer
end

def path_clip
  @caller_path[0].split('/').last(2).join('/').split(':in')[0]
end

def display_variable(add_awesome_print)
  proc = Proc.new { @variable }
  if add_awesome_print
    require 'awesome_print'
    ap proc.call
  else
    p proc.call
  end
end

# 40 rando emojis for fun && eye catching line breaks
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
