require 'pg'

class Line
  attr_reader :name, :stops, :id

  def initialize(line_info)
    @name = line_info[:name]
    @stops = line_info[:stops]
  end

  def self.all
    results = DB.exec("SELECT * FROM lines;")
    lines = []
    results.each do |result|
      name = result['name']
      lines << Line.new({:name => name})
    end
    lines
  end

  def save
    results = DB.exec("INSERT INTO lines (name) VALUES ('#{@name}') RETURNING id;")
    @id = results.first['id'].to_i
    self.stops.each do |stop|
      select = DB.exec("SELECT * FROM stations WHERE name = '#{stop}' RETURNING id;")
      id = select.first['id'].to_i
      DB.exec("INSERT INTO stops (station_id, line_id) VALUES (#{id}, #{@id};")
    end
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

end
