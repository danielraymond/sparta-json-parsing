require 'spec_helper'

describe 'Testing the exchange rates' do

  before(:all) do
    @exchange_rates = ParseJson.new('json_exchange_rates.json')
  end

  it "Should be a hash" do
    expect(@exchange_rates.json_file).to be_kind_of(Hash)
  end

  it "The value in the base key should be EUR" do
    expect(@exchange_rates.get_base_value).to eq('EUR')
  end

  it "The value in the date key should be the current date" do
    expect(@exchange_rates.get_date_value).to eq(@exchange_rates.get_current_date)
  end

  it "The value of all the keys in the rates key should be strings" do
    # @exchange_rates.json_file['rates'].each do |key,value|
    #   expect(key).to be_kind_of(String)
    # end
    expect(@exchange_rates.get_rates_values).to be_kind_of(String)
  end

  it "The values of each of the rates for each country should be floats" do
    @exchange_rates.json_file['rates'].each do |key,value|
      expect(value).to be_kind_of(Float)
    end
  end

end
