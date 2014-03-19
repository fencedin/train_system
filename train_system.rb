require 'pg'
require './lib/station'
require './lib/line'

DB = PG.connect({:dbname => 'train_system'})

def welcome
  puts "                                       (@@@)     (@@@@@)"
  puts "                                 (@@)     (@@@@@@@)        (@@@@@@@)"
  puts "                           (@@@@@@@)   (@@@@@)       (@@@@@@@@@@@)"
  puts "                      (@@@)     (@@@@@@@)   (@@@@@@)             (@@@)"
  puts "                 (@@@@@@)    (@@@@@@)                (@)"
  puts "             (@@@)  (@@@@)           (@@)"
  puts "          (@@)              (@@@)"
  puts "         .-.               "
  puts "         ] [    .-.      _    .-----."
  puts "       .\"   \"\"\"\"   \"\"\"\"\"\" \"\"\"\"| .--`"
  puts "      (:--:--:--:--:--:--:--:-| [___    .------------------------."
  puts "       |C&O  :  :  :  :  :  : [_9_] |'='|.----------------------.|"
  puts "      /|.___________________________|___|'--.___.--.___.--.___.-'| "
  puts "     / ||_.--.______.--.______.--._ |---\\'--\\-.-/==\\-.-/==\\-.-/-'/--"
  puts "    /__;^=(==)======(==)======(==)=^~^^^ ^^^^(-)^^^^(-)^^^^(-)^^^"
  puts "  ~~~^~~~~^~~~^~~~^~~~^~~~^~~~^~~~^~~~^~~~^~~~^~~~^~~~^~~~^~~~^~~~^~~~^~~"

  puts "\n\ns - system operator"
  puts "p - passenger"
  puts "x - exit"
  input = gets.chomp
  system "clear"
  if input == "s"
    system_operator_menu
  elsif input == "p"
    passenger_menu
  elsif input =="x"
    puts "Bye\n\n"
  else
    system "clear"
    puts "invalid input\n\n"
    welcome
  end
end

def system_operator_menu
  puts "c - create station"
  puts "r - read station"
  puts "u - update station"
  puts "d - destroy station\n\n"

  puts "lc - create line"
  puts "lr - read line"
  puts "lu - update line"
  puts "ld - destroy line\n\n"

  puts 'm - main menu'
  input = gets.chomp
  system "clear"

  if input == 'c'
    create_station
  elsif input == 'r'
    read_station
    puts "\n\n****************************************\n\n"
    system_operator_menu
  elsif input == 'u'
    update_station
  elsif input == 'd'
    destroy_station
  elsif input == 'lc'
    create_line
  elsif input == 'lr'
    read_line
    puts "\n\n****************************************\n\n"
    system_operator_menu
  elsif input == 'lu'
    update_line
  elsif input == 'ld'
    destroy_line
  elsif input == 'm'
    welcome
  else
    puts 'invalid input'
  system_operator_menu
  end
end

def passenger_menu
  puts 's - view stations'
  puts 'l - view lines'
  puts 'm - main menu'

  input = gets.chomp

  if input == 's'
    passenger_stations
  elsif input == 'l'
    passenger_lines
  elsif input == 'm'
    welcome
  else
    'invalid input'
    passenger_menu
  end
end

def passenger_stations
  read_station

  puts "******************************"
  puts "v - select number to view station lines"
  puts "b - back"

  input = gets.chomp

  if input == 'v'

  elsif input == 'b'
    passenger_menu
  else
    puts 'invalid input'
    passenger_stations
  end
end

def view_station_lines
  read_station
  puts "******************************"
  puts 'Enter a station number to view its lines'

  input = gets.chomp.to_i

  station = Station.all[input-1]


end

def passenger_lines
  read_line
end
def create_station
  puts 'Name of new station: '
  station_name = gets.chomp
  system "clear"
  new_station = Station.new({:name => station_name})
  new_station.save
  puts 'station added'
  system_operator_menu
end

def read_station
  puts 'Stations: '
  Station.all.each_with_index do |station, index|
    puts "#{index+1}. #{station.name}"
  end
end

def update_station
  read_station
  puts "*************************************"
  puts "Choose a station number to update"

  input = gets.chomp.to_i

  to_update = Station.all[input-1]

  puts "New name: "
  new_name = gets.chomp
  to_update.update(new_name)
  system "clear"
  puts "*************************************"
  puts "Name updated to: #{new_name}"
  puts "*************************************"

  system_operator_menu
end

def destroy_station
  read_station
  puts "*************************************"
  puts "Choose a station number to delete: "

  input = gets.chomp.to_i

  to_delete = Station.all[input-1]

  to_delete.delete(to_delete.name)
  system "clear"
  puts "*************************************"
  puts "               Deleted!              "
  puts "*************************************"
  system_operator_menu
end

def create_line
  puts 'Name of new line: '
  line_name = gets.chomp
  system "clear"
  new_line = Line.new({:name => line_name})
  new_line.save
  puts 'line added'
  system_operator_menu
end

def update_line
  read_line
  puts "*************************************"
  puts "Choose a line number to update"

  input = gets.chomp.to_i

  to_update = Line.all[input-1]

  puts "New name: "
  new_name = gets.chomp
  to_update.update(new_name)
  system "clear"
  puts "*************************************"
  puts "Name updated to: #{new_name}"
  puts "*************************************"

  system_operator_menu
end

def read_line
  puts 'Lines: '
  Line.all.each_with_index do |line, index|
    puts "#{index+1}. #{line.name}"
  end
end

def destroy_line
  read_line
  puts "*************************************"
  puts "Choose a line number to delete: "

  input = gets.chomp.to_i

  to_delete = Line.all[input-1]

  to_delete.delete(to_delete.name)
  system "clear"
  puts "*************************************"
  puts "               Deleted!              "
  puts "*************************************"
  system_operator_menu
end
system "clear"
welcome
