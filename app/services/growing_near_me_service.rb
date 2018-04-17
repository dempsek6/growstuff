class GrowingNearMeService

  # PlantingsFound shows us what plantings we found.  After we find all of the gardens
  # within a particular distance radius, we go through them and put every single planting
  # within them into this class.  The plantings are stored in a hash, with crop name as
  # key and an array of all plantings of that crop as value.
  class PlantingsFound
    def initialize()
      @found = hash.new
    end
    def addPlanting(Planting plant)
      if @found.has_key?(Crop.find(plant.crop_id)) #if that kind of crop is already in the hash...
         found[Crop.find(plant.crop_id)].push(plant) #add this planting to that crop's array.
      else
         newArray = []
	 newArray.push(plant)			    #else
         found[Crop.find(plant.crop_id)] = newArray #add the crop as a key, and put the planting in its corresponding array.
      end
    end
    def clearFound #gets rid of all the data
      found.clear
    end
  end

  def self.search(location, radius)
      # just do a basic SQL query.
      # also, make sure it's an actual array not an activerecord
      # collection, so it matches what we get from elasticsearch and we can
      # manipulate it in the same ways (eg. deleting elements without deleting
      # the whole record from the db)

      matches = [] #matches will hold the search results

      #first, we need to find the latitude and longitude coordinates of the location.
      #To do this, we search through all of the gardens until we find one with a location
      #string that matches the one entered by the user.
      
      gardens = Garden.approved.find_by(location: location)

      if gardens.size == 0
        matches
        return
      end

      latitude = gardens.first.latitude
      longitude = gardens.first.longitude

      #now that we have the latitude and longitude, we need to calculate the mile radius.
      #For latitude, 1 mile is 1/69 degrees latitude.
      radiusLatitude = radius/69
      #The longitude calculation is more complicated.  For right now, I am going to simply
      #use radiusLatitude as the radius for both latitude and longitude.  This is
      #mathematically innacurate, but easier to implement.
      radiusLongitude = radiusLatitude
      
      #now, we go and look through all the gardens again, but this time looking for all
      #gardens within the radius specified.  So all gardens whose latitude is...
      #        > greater than latitude - radiusLatitude
      #        > less than latitude + radiusLatitude
      #and whose longitude is...
      #        > greater than longitude - radiusLongitude
      #        > less than longitude + radiusLongitude
      gardens.clear

      gardens = Garden.approved.where("latitude > ? AND latitude < ? AND longitude > ? AND longitude < ?", (latitude - radiusLatitude), (latitude + radiusLatitude), (longitude - radiusLongitude), (longitude + radiusLongitude))

      #now that we've found all our gardens, we need to find every planting within those
      #gardens.  Here's where the PlantingsFound defined above comes in.
      #For each planting we find within those gardens, we add it to PlantingsFound.
      #PlantingsFound automatically organizes plantings by crop, letting us see how many
      #of each crop are growing within the provided planting.  It lets us see, in essence,
      #"What's Growing Near Me?"

      foundPlantings = PlantingsFound.new()

      #So let's go through the gardens, and look at all of their plantings.

      gardens.each do |garden|  #go through each garden
        plantings_in_garden = garden.plantings #get all the plantings in that garden
        plantings_in_garden.each do |planting| #for each planting in the garden...
          foundPlantings.addPlanting(planting) #...add it to our PlantingsFound object.
        end
      end

      #Now, we are going to get the data out of the PlantingsFound object.  What we want
      #is a nested array that looks something like this:
      #   [ [crop_name, allPlantings[] ], [crop_name_2, allPlantings2[] ] ]
      #Where "crop_name" is the name of the crop, and allPlantings is an array of all
      #the plantings containing that crop.  We can call this array cropsArray.  We want
      #cropsArray to be sorted based on how many plantings there are of each crop.  That
      #way, as search results, we can show the user a list of crops growing in their area,
      #with the most commonly grown crop first and other less commonly grown crops after it
      #in descending order.  So let's make cropsArray...

      cropsArray = foundPlantings.found.sort_by{ |crop, plants| plants.length }

      #and reverse cropsArray, since right now it has the least grown crop as the first
      #element, and we'd like it the other way around.

      cropsArray.reverse!

      #Now, we have all the data we wanted to find.  We want to return it as an array of
      #crop objects.

      cropsArray.each do |crop|
        matches.push(crop[1])
      end

      matches

  end
end
