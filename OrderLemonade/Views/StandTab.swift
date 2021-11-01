//
//  StandTab.swift
//  OrderLemonade
//
//  Created by Gowtham Namuri on 28/10/21.
//

import SwiftUI

struct StandTab: View {
  @State var stands = standData

  var body: some View {
    TabView {
      NavigationView {
        StandList(
          stands: $stands,
          tabTitle: "Stands",
          hideFav: false)
        MenuList(stand: stands[0])
      }
      .tabItem {
        Label("Stands", systemImage: "house")
      }

      NavigationView {
        StandList(
          stands: $stands,
          tabTitle: "Favorite Stands",
          hideFav: true)
        MenuList(stand: stands[0])
      }
      .tabItem {
        Label("Favorites", systemImage: "heart.fill")
      }
    }
  }
}

struct StandTabView_Previews: PreviewProvider {
  static var previews: some View {
      StandTab()
  }
}
