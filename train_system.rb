require 'pg'
require './lib/station'
require './lib/line'
require './lib/color'


DB = PG.connect({:dbname => 'train_system'})

def welcome
  puts "\e[5;90m\n                                       (@@@)     (@@@@@)"
  puts "                                 (@@)     (@@@@@@@)        (@@@@@@@)"
  puts "                           (@@@@@@@)   (@@@@@)       (@@@@@@@@@@@)"
  puts "                      (@@@)     (@@@@@@@)   (@@@@@@)             (@@@)"
  puts "                 (@@@@@@)    (@@@@@@)                (@)"
  puts "             (@@@)  (@@@@)           (@@)"
  puts "          (@@)              (@@@)\e[0;31m"
  puts "         .-.               "
  puts "         ] [    .-.      _    .-----."
  puts "       .\"   \"\"\"\"   \"\"\"\"\"\" \"\"\"\"| .--`"
  puts "      (:--:--:--:--:--:--:--:-| [___    .------------------------."
  puts "       |\e[5;33mEPICODUS\e[0;31m:  :  :  :  :[_E9_] |'='|.----------------------.|"
  puts "      /|.___________________________|___|'--.___.--.___.--.___.-'| "
  puts "     / ||_.--.______.--.______.--._ |---\\'--\\-.-/==\\-.-/==\\-.-/-'/--"
  puts "    /__;^=(==)======(==)======(==)=^~^^^ ^^^^(-)^^^^(-)^^^^(-)^^^\e[0m"
  puts "  ~~~^~~~~^~~~^~~~^~~~^~~~^~~~^~~~^~~~^~~~^~~~^~~~^~~~^~~~^~~~^~~~^~~~^~~"

  puts "\n\ns - system operator"
  puts "p - passenger"
  puts "x - exit\n\n"
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

  puts "m - main menu\n\n"
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
  puts "s - view stations"
  puts "l - view lines"
  puts "m - main menu\n\n"

  input = gets.chomp

  if input == 's'
    passenger_stations
  elsif input == 'l'
    passenger_lines
  elsif input == 'm'
    system "clear"
    welcome
  else
    system "clear"
    'invalid input'
    passenger_menu
  end
end

def passenger_stations
  read_station

  puts "******************************"
  puts "v - select number to view station lines"
  puts "b - back\n\n"

  input = gets.chomp

  if input == 'v'
    list_stops
  elsif input == 'b'
    system "clear"
    passenger_menu
  else
    puts 'invalid input'
    passenger_stations
  end
end

def list_stops
  read_line

  puts "Enter the number of the line to view its stops."
  input = gets.chomp.to_i

  line = Line.all[input-1]
  system "clear"
  puts "All stops: "
  line.stops.each do |stop|
    puts "#{stop['name']}"
  end
  puts "***********************"
  passenger_stations
end

def view_station_lines
  read_station
  puts "******************************"
  puts "Enter a station number to view its lines\n\n"

  input = gets.chomp.to_i

  station = Station.all[input-1]


end

def passenger_lines
  read_line
end
def create_station
  puts "Name of new station: \n\n"
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
  puts "Choose a station number to update\n\n"

  input = gets.chomp.to_i

  to_update = Station.all[input-1]

  puts "New name: \n\n"
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
  puts "Choose a station number to delete: \n\n"

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
  puts "Name of new line: \n\n"
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
  puts "Choose a line number to update name or add a stop\n\n"

  input = gets.chomp.to_i

  to_update = Line.all[input-1]

  puts "e - edit name"
  puts "s - add stop to line\n\n"
  input2 = gets.chomp

  if input2 == 'e'
    edit_line_name(to_update)
  elsif input2 == 's'
    add_line_stop(to_update)
  else
    system "clear"
    puts 'invalid entry'
    update_line
  end

end

def edit_line_name(update_name)
  puts "New name: \n\n"
  new_name = gets.chomp
  update_name.update(new_name)
  system "clear"
  puts "*************************************"
  puts "Name updated to: #{new_name}"
  puts "*************************************"

  system_operator_menu
end

def add_line_stop(adding_stop)
  read_station
  puts "New stop: "
  input = gets.chomp.to_i

  to_add = Station.all[input-1]
  adding_stop.add_stop(to_add)
  system "clear"
  puts "*******************************"
  puts "Your stop has been added, thank you for creating a new destination for customers, they greatly appreciate it"
  puts "*******************************"
  puts "they really do appreciate it!"
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
  puts "Choose a line number to delete: \n\n"

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
