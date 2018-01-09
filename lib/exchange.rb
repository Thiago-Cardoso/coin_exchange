require 'rest-client'
require 'json'

module Currency     #coin now  #coin for change     #quantity
  def self.exchange currency, currency_destination, quantity
    begin
      res = RestClient.get "http://api.fixer.io/latest?base=#{currency}&symbols=#{currency_destination}" #call api
      value = JSON.parse(res.body)['rates'][currency_destination] #return value of json
      return (value * quantity).round(2) #conversion
    rescue
      return 'Problem in Conversion'
    end
  end
end
