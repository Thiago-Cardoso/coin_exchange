require 'spec_helper'
require './lib/exchange'

#test of lib
describe Currency do
  it "exchange" do
    json = JSON.parse(File.read("./spec/fixtures/currency_list.json")) # load of field currency_list.json
    currency, currency_destination = json['currency_list'].sample(2) # parse of json randomic and different of array
    quantity = rand(1..9999) #acess first element of currency_list

    value = Currency::exchange currency, currency_destination, quantity
    puts value
    expect(value.is_a? Numeric).to eql(true)
    expect(value != 0).to eql(true)
  end
end
