require 'yr_no/client'
require 'yr_no/location'
require 'yr_no/version'
require 'multi_xml'

module YrNo
  URI = URI.parse("http://api.yr.no/weatherapi")

  # Api calls
  def self.locationforecast(latitude, longitude)
    product = __method__
    version = 1.8
    YrNo.api_call(product, version, lat: latitude, lon: longitude)
  end

  # Internal methods
  # @TODO: put this in client.rb?
  def self.api_call(product, version, **args)
    uri = self.build_uri(product, version, **args)
    client = YrNo::Client.new
    resp = client.connection.get uri

    if resp.success?
      return Hashie::Mash.new(MultiXml.parse(resp.body))
    end
  end

  def self.build_uri(product, version, **args)
    path = "#{product}/#{version}"
    query = args.map { |k, v|
      "#{k}=#{v}"
    }.join(';')

    "#{URI}/#{path}/?#{query}"
  end

end
