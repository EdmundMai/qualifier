require 'spec_helper'

describe Company do

  describe "#initialize" do
    it "sets the company's ticker" do 
      company = Company.new(ticker: 'amzn')
      company.ticker.should == 'amzn'
      company.retrieve_data
    end

    it "sets the qualifier" do 
      qualifier = double('qualifier')
      company = Company.new(qualifier: qualifier)
      company.qualifier.should == qualifier
    end
  end

  describe "#qualified?" do
  	it "sends evaluate to a qualifier" do
      qualifier = double('qualifier')
  		company = Company.new(qualifier: qualifier)
      qualifier.should_receive(:evaluate)
      company.qualified?
  	end
  end

  describe "#retrieve_data" do
    it "returns the upward or downward percentage in the last six months" do
      uri = URI('http://finance.yahoo.com')
      response = Net::HTTP.get(uri)
      expect(response).to be_an_instance_of(String)
    end
  end

end