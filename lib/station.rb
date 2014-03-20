require 'pg'
require 'pry'


class Station
  attr_reader :name, :id

  def initialize(station_info)
    @name = station_info[:name]
    @id = station_info[:id]

  end

  def self.all
    results = DB.exec("SELECT * FROM stations;")
    stations = []
    results.each do |result|
      name = result['name']
      id = result['id']
      stations << Station.new({:name => name, :id => id})
    end
    stations
  end

  def save
    results = DB.exec("INSERT INTO stations (name) VALUES ('#{@name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(another_station)
    self.name == another_station.name
  end

  def update(station_name)
    @name = station_name
    DB.exec("UPDATE stations SET name = '#{@name}';")
  end

  def delete(station_name)
    DB.exec("DELETE FROM stations WHERE name = '#{station_name}';")
  end
end
