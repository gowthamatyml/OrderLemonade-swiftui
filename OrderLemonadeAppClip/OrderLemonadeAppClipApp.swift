//
//  OrderLemonadeAppClipApp.swift
//  OrderLemonadeAppClip
//
//  Created by Gowtham Namuri on 01/11/21.
//

import SwiftUI
import CoreLocation
import AppClip

@main
struct OrderLemonadeAppClipApp: App {
    
    @StateObject private var model = LemonadeClipModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
                .onContinueUserActivity(NSUserActivityTypeBrowsingWeb, perform: handleUserActivity)
        }
    }
    
    
    func handleUserActivity(_ userActivity: NSUserActivity) {
        guard let incomingURL = userActivity.webpageURL,
              let components = URLComponents(url: incomingURL, resolvingAgainstBaseURL: true),
              let queryItems = components.queryItems else {
          return
        }
        
        guard let latValue = queryItems.first(where: { $0.name == "lat" })?.value,
              let lonValue = queryItems.first(where: { $0.name == "lon" })?.value,
              let lat = Double(latValue),
              let lon = Double(lonValue) else {
          return
        }
        
        let location = CLLocationCoordinate2D(latitude: CLLocationDegrees(lat), longitude: CLLocationDegrees(lon))
        if let stand = standData.first(where: { $0.coordinate == location }) {
          model.selectedStand = stand
        } else {
          model.locationFound = false
        }
        
        guard let payload = userActivity.appClipActivationPayload else {
          return
        }
        
        let region = CLCircularRegion(
          center: location,
          radius: 500,
          identifier: "stand_location"
        )
        
        payload.confirmAcquired(in: region) { inRegion, error in
          guard error == nil else {
              print(String(describing: error?.localizedDescription))
              return
          }
          
          DispatchQueue.main.async {
            model.paymentAllowed = inRegion
          }
        }
      }
}
