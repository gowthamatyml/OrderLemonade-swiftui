//
//  ContentView.swift
//  OrderLemonadeAppClip
//
//  Created by Gowtham Namuri on 01/11/21.
//

import SwiftUI

struct ContentView: View {
  
  @EnvironmentObject private var model: LemonadeClipModel
  
  var body: some View {
    if let selectedStand = model.selectedStand {
      NavigationView {
        MenuList(stand: selectedStand)
      }
    }
    
    if model.locationFound == false {
      Text("There are no lemonade stands nearby.")
      
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
