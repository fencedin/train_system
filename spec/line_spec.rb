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

  it 'gives all the stops' do
    line = Line.new({:name => 'Green', :stops => ['Portland', 'Charlotte']})
    line.stops.should eq ['Portland', 'Charlotte']
  end

  describe '.all' do
    it 'starts as an empty array' do
      line = Line.new({:name => 'Yellow'})
      Line.all.should eq []
    end
  end

  describe 'save' do
    it 'saves the line to the' do
      line = Line.new({:name => 'Red'})
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
end
