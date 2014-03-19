require 'spec_helper'

describe 'Station' do
  it 'initializes with a name' do
    station = Station.new({:name => 'Beaverton Central'})
    station.should be_an_instance_of Station
  end

  it 'gives back the station name' do
    station = Station.new({:name => 'San Francisco'})
    station.name.should eq 'San Francisco'
  end

  describe '.all' do
    it 'starts as an empty array' do
      station = Station.new({:name => 'Dallas'})
      Station.all.should eq []
    end
  end

  describe 'save' do
    it 'saves the station to the' do
      station = Station.new({:name => 'Toronto'})
      station.save
      Station.all.should eq [station]
    end
  end

  it 'is the same station if it has the same attributes' do
    station1 = Station.new({:name => 'Toronto'})
    station2 = Station.new({:name => 'Toronto'})
    station1.should eq station2
  end

  it 'should update an attribute of the station' do
    station = Station.new({:name => 'Toronto'})
    station.save
    station.update('Los Angeles')
    station.name.should eq 'Los Angeles'
  end

  it 'deletes the record' do
    station = Station.new({:name => 'Charlotte'})
    station.save
    station.delete('Charlotte')
    Station.all.should eq []
  end

end
