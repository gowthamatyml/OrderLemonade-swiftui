//
//  LemonadeStandLocations.swift
//  OrderLemonade
//
//  Created by Gowtham Namuri on 28/10/21.
//

import Foundation
import MapKit


struct Location {
  let title: String
  let coordinate: CLLocationCoordinate2D
}

let locationData = [
  Location(title: "LA Galaxy", coordinate: .dignityHealthSportsPark),
  Location(title: "Chicago Fire", coordinate: . soldierField ),
  Location(title: "Seattle Sounders", coordinate: .centuryLinkField),
  Location(title: "New York City FC", coordinate: .yankeeStadium),
  Location(title: "Los Angeles FC", coordinate: .bancOfCalifornia)
]

extension CLLocationCoordinate2D {
  static public var dignityHealthSportsPark: CLLocationCoordinate2D {
    return CLLocationCoordinate2D(latitude: CLLocationDegrees(33.8644), longitude: CLLocationDegrees(-118.2611))
  }

  static public var soldierField: CLLocationCoordinate2D {
    return CLLocationCoordinate2D(latitude: CLLocationDegrees(41.85749657), longitude: CLLocationDegrees(-87.6166642))
  }

  static public  var centuryLinkField: CLLocationCoordinate2D {
    let latitude = CLLocationDegrees(47.59049763)
    let longitude = CLLocationDegrees(-122.325665364)
    return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
  }

  static public var yankeeStadium: CLLocationCoordinate2D {
    return CLLocationCoordinate2D(latitude: CLLocationDegrees(40.8241633), longitude: CLLocationDegrees(-73.92249631))
  }

  static public var bancOfCalifornia: CLLocationCoordinate2D {
    return CLLocationCoordinate2D(latitude: CLLocationDegrees(34.0112), longitude: CLLocationDegrees(-117.8275))
  }
}

extension CLLocationCoordinate2D: Equatable {
  public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
    let location1 = CLLocation(latitude: lhs.latitude, longitude: lhs.longitude)
    let location2 = CLLocation(latitude: rhs.latitude, longitude: rhs.longitude)

    //distance in meters
    let distance = location1.distance(from: location2)
    return distance < 1
  }
}
