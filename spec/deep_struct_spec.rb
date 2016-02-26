require 'spec_helper'
require 'deep_struct'

RSpec.describe DeepStruct do  
  it 'should initialize without any parameters' do
    expect{ DeepStruct.new }.not_to raise_error
  end 

  it 'should acts like ostruct at one level deep' do
    s = DeepStruct.new(a: 1, b: 2, c: 3)
    expect(s.a).to eq 1
    expect(s.b).to eq 2
    expect(s.c).to eq 3
  end 

  it 'should create deep attributes for simple nested values' do
    s = DeepStruct.new(a: { b: { c: 1 } })
    expect(s.a.b.c).to eq 1
  end 

  it 'should create deep attributes for array values' do
    s = DeepStruct.new(a: [ 1, 2, 3 ])
    expect(s.a).to match_array [ 1,2,3 ]
  end 

  it 'should create deep attributes for array values with hashes' do
    s = DeepStruct.new(a: [ { b: 1 }, { c: 2 } ])
    expect(s.a[0].b).to be 1
    expect(s.a[1].c).to be 2
  end 

  it 'should handle simple assignment' do
    s = DeepStruct.new(a: 1, b: 2, c: 3)
    s.a = 10
    expect(s.to_h[:a]).to be 10
  end 

  it 'should handle nested assignment' do
    s = DeepStruct.new(a: { b: { c: 1 } })
    s.a.b.c = 10
    expect(s.to_h[:a][:b][:c]).to be 10
  end 

  it 'should handle assignment when in array' do
    s = DeepStruct.new(a: [ 1, 2, 3 ])
    s.a[2] = 10
    expect(s.to_h[:a]).to match_array [ 1,2,10 ]
  end 

  it 'should handle assignment of nested attributes in array' do
    s = DeepStruct.new(a: [ { b: 1 } ])
    s.a[0].b = 10
    expect(s.to_h[:a][0][:b]).to be 10
  end 
end
