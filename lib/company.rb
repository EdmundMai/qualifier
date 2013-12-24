require 'net/http'

class Company
  attr_reader :ticker, :qualifier
  def initialize(args={})
    @ticker = args[:ticker]
    @qualifier = args[:qualifier]
  end

  def qualified?
    qualifier.evaluate(self)
  end

  def retrieve_data
    uri = URI.parse("http://finance.yahoo.com/d/quotes.csv?s=#{self.ticker}&f=sm6")
    response = Net::HTTP.start(uri)
    puts response
  end

end