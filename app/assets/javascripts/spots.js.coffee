toMiles = (meters) ->
  (meters * 0.000621371192).toFixed(1)

toLocation = (node) ->
  new google.maps.LatLng(
    parseFloat(node.data('latitude')),
    parseFloat(node.data('longitude'))
  )

class DistanceCalculator
  constructor: (locationNode) ->
    @location = toLocation(locationNode)

  calculate: (other) =>
    other = toLocation(other)
    google.maps.geometry.spherical.computeDistanceBetween(@location, other)

class FromDecorator
  constructor: (locationNode) ->
    @node = locationNode
    @location = toLocation(locationNode)

  setDistanceText: (name) =>
    geo = navigator?.geolocation
    if geo?
      geo.getCurrentPosition (position) =>
        other = new google.maps.LatLng(
          position.coords.latitude,
          position.coords.longitude
        )
        distance = google.maps.geometry.spherical.computeDistanceBetween(toLocation(@node), other)
        if isNaN(distance)
          name.remove()
        else
          name.text("#{toMiles(distance)} miles away")
      , (errors) ->
        name.remove()

    else
      name.remove()

class NearbyDecorator
  constructor: (@spot, @nearbySpots) ->

  setNearbyText: (fromText) =>
    calculator = new DistanceCalculator(@spot)

    for nearby in @nearbySpots
      distance  = calculator.calculate($(nearby))

      if isNaN(distance)
        nearby.remove()
      else
        distanceText = "#{toMiles(distance)} miles from #{fromText}"

        $(nearby).find('.spot-distance').text(distanceText)

$ ->
  if google?.maps?.geometry?
    index = $('.spots-index')
    for spot in index.find('.spot')
      spot = $(spot)
      new FromDecorator(spot).setDistanceText(spot.find('.spot-distance'))

    show = $('.spots-show')

    spot        = $(show.find('.spot').first())
    away        = spot.find('.spot-distance')
    spotName    = spot.find('.spot-name').text()
    nearbySpots = show.find('.spots-nearby .spot')

    new FromDecorator(spot).setDistanceText(away)

    new NearbyDecorator(spot, nearbySpots).setNearbyText(spotName)



