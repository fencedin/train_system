require 'pg'
require 'pry'

class Line
  attr_reader :name, :id

  def initialize(line_info)
    @name = line_info[:name]
    @id = line_info[:id]
  end

  def self.all
    results = DB.exec("SELECT * FROM lines;")
    lines = []

    results.each do |result|
      name = result['name']
      id = result['id']
      lines << Line.new({:name => name, :id => id})
    end
    lines
  end

  def save
    results = DB.exec("INSERT INTO lines (name) VALUES ('#{@name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(another_line)
    self.name == another_line.name
  end

  def update(line_name)
    @name = line_name
    DB.exec("UPDATE lines SET name = '#{@name}';")
  end

  def delete(line_name)
    DB.exec("DELETE FROM lines WHERE name = '#{line_name}';")
  end

  def add_stop(station)
    result = DB.exec("INSERT INTO stops (station_id, line_id) VALUES (#{station.id}, #{@id});")
  end

  def stops
    results = DB.exec("SELECT * FROM stops WHERE line_id = #{@id};")

    stops = []
    results.each do |result|
      station_id = result['station_id'].to_i
      station_name = DB.exec("SELECT * FROM stations WHERE id = #{station_id}")
      stops << station_name.first
    end
    stops
  end

end
