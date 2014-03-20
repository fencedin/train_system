class Color
#normal colors
  def Color.black(string)
    "\e[0;30m" + string + "\e[0m"
  end
  def Color.red(string)
    "\e[0;31m" + string + "\e[0m"
  end
  def Color.green(string)
    "\e[0;32m" + string + "\e[0m"
  end
  def Color.brown(string)
    "\e[0;33m" + string + "\e[0m"
  end
  def Color.blue(string)
    "\e[0;34m" + string + "\e[0m"
  end
  def Color.purple(string)
    "\e[0;35m" + string + "\e[0m"
  end
  def Color.cyan(string)
    "\e[0;36m" + string + "\e[0m"
  end
  def Color.white(string)
    "\e[0;37m" + string + "\e[0m"
  end
#bold colors
  def Color.bold_black(string)
    "\e[1;30m" + string + "\e[0m"
  end
  def Color.bold_red(string)
    "\e[1;31m" + string + "\e[0m"
  end
  def Color.bold_green(string)
    "\e[1;32m" + string + "\e[0m"
  end
  def Color.bold_brown(string)
    "\e[1;33m" + string + "\e[0m"
  end
  def Color.bold_blue(string)
    "\e[1;34m" + string + "\e[0m"
  end
  def Color.bold_purple(string)
    "\e[1;35m" + string + "\e[0m"
  end
  def Color.bold_cyan(string)
    "\e[1;36m" + string + "\e[0m"
  end
  def Color.bold_white(string)
    "\e[1;37m" + string + "\e[0m"
  end
#underlined colors
  def Color.under_black(string)
    "\e[4;30m" + string + "\e[0m"
  end
  def Color.under_red(string)
    "\e[4;31m" + string + "\e[0m"
  end
  def Color.under_green(string)
    "\e[4;32m" + string + "\e[0m"
  end
  def Color.under_brown(string)
    "\e[4;33m" + string + "\e[0m"
  end
  def Color.under_blue(string)
    "\e[4;34m" + string + "\e[0m"
  end
  def Color.under_purple(string)
    "\e[4;35m" + string + "\e[0m"
  end
  def Color.under_cyan(string)
    "\e[4;36m" + string + "\e[0m"
  end
  def Color.under_white(string)
    "\e[4;37m" + string + "\e[0m"
  end
#background color
  def Color.bg_black(string)
    "\e[40m" + string + "\e[0m"
  end
  def Color.bg_red(string)
    "\e[41m" + string + "\e[0m"
  end
  def Color.bg_green(string)
    "\e[42m" + string + "\e[0m"
  end
  def Color.bg_brown(string)
    "\e[43m" + string + "\e[0m"
  end
  def Color.bg_blue(string)
    "\e[44m" + string + "\e[0m"
  end
  def Color.bg_purple(string)
    "\e[45m" + string + "\e[0m"
  end
  def Color.bg_cyan(string)
    "\e[46m" + string + "\e[0m"
  end
  def Color.bg_white(string)
    "\e[47m" + string + "\e[0m"
  end
#blinking color
  def Color.blink_black(string)
    "\e[5;30m" + string + "\e[0m"
  end
  def Color.blink_red(string)
    "\e[5;31m" + string + "\e[0m"
  end
  def Color.blink_green(string)
    "\e[5;32m" + string + "\e[0m"
  end
  def Color.blink_brown(string)
    "\e[5;33m" + string + "\e[0m"
  end
  def Color.blink_blue(string)
    "\e[5;34m" + string + "\e[0m"
  end
  def Color.blink_purple(string)
    "\e[5;35m" + string + "\e[0m"
  end
  def Color.blink_cyan(string)
    "\e[5;36m" + string + "\e[0m"
  end
  def Color.blink_white(string)
    "\e[5;37m" + string + "\e[0m"
  end
#light color
  def Color.light_black(string)
    "\e[90m" + string + "\e[0m"
  end
  def Color.light_red(string)
    "\e[91m" + string + "\e[0m"
  end
  def Color.light_green(string)
    "\e[92m" + string + "\e[0m"
  end
  def Color.light_brown(string)
    "\e[93m" + string + "\e[0m"
  end
  def Color.light_blue(string)
    "\e[94m" + string + "\e[0m"
  end
  def Color.light_purple(string)
    "\e[95m" + string + "\e[0m"
  end
  def Color.light_cyan(string)
    "\e[96m" + string + "\e[0m"
  end
  def Color.light_white(string)
    "\e[97m" + string + "\e[0m"
  end



#   def Color.light_blue(string)
#     "\e[94m" + string + "\e[0m"
#   end
#   def Color.light_green(string)
#     "\e[92m" + string + "\e[0m"
#   end


end
