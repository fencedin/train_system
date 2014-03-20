require 'spec_helper'

describe 'Line' do
  it 'initializes with a name' do
    line = Line.new({:name => 'Blue'})
    line.should be_an_instance_of Line
  end

  it 'gives back the line name' do
    line = Line.new({:name => 'Green'})
    line.name.should eq 'Green'
  end


  describe '.all' do
    it 'starts as an empty array' do
      line = Line.new({:name => 'Yellow'})
      Line.all.should eq []
    end

    it 'adds a line with name and id' do
      line = Line.new({:name => 'Blue'})
      line.save
      Line.all[0].id.should eq line.id
    end
  end

  describe 'save' do
    it 'saves the line and stop(s) to the array' do
      line = Line.new({:name => 'Red'})
      station1 = Station.new({:name => 'Charlotte'})
      station2 = Station.new({:name => 'Portland'})
      station1.save
      station2.save
      line.save
      Line.all.should eq [line]
    end
  end

  it 'is the same line if it has the same attributes' do
    station1 = Line.new({:name => 'Orange'})
    station2 = Line.new({:name => 'Orange'})
    station1.should eq station2
  end

  it 'should update an attribute of the line' do
    line = Line.new({:name => 'Blue'})
    line.save
    line.update('Red')
    line.name.should eq 'Red'
  end

  it 'deletes the record' do
    line = Line.new({:name => 'Red'})
    line.save
    line.delete('Red')
    Line.all.should eq []
  end

  describe 'add_stop' do
    it 'adds a stop to a line' do
      line = Line.new({:name => 'Red'})
      station = Station.new({:name => 'Portland'})
      station.save
      line.save
      line.add_stop(station)
      line.stops.first['name'].should eq "Portland"
    end
  end

  describe '#stops' do
    it 'returns all the stops for a line' do
      line = Line.new({:name => 'Red'})
      station = Station.new({:name => 'Portland'})
      station.save
      line.save
      line.add_stop(station)
      line.stops.first['name'].should eq "Portland"
    end
  end
end
