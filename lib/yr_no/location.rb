module YrNo
  class Location
    attr_accessor :latitude, :longitude

   def initialize(lat, lng)
     self.latitude = lat
     self.longitude = lng
    end
  end
end
