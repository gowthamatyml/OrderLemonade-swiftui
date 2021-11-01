//
//  DetailView.swift
//  OrderLemonade
//
//  Created by Gowtham Namuri on 01/11/21.
//

import SwiftUI

struct DetailView: View {
#if APPCLIP
@EnvironmentObject private var model: LemonadeClipModel
#endif

@State private var showWarningAlert = false
@State private var orderPlaced = false
let lemonade: Lemonade

private func placeOrder() {
  #if APPCLIP
  guard model.paymentAllowed else {
    showWarningAlert = true
    return
  }
  #endif
  orderPlaced = true
}

var body: some View {
  VStack {
    Image(lemonade.imageName)
      .resizable()
      .frame(maxWidth: 300, maxHeight: 600)
      .aspectRatio(contentMode: .fit)
    Text(lemonade.title)
      .font(.headline)
    Divider()
    Text("\(lemonade.calories) Calories")
      .font(.subheadline)
      .padding(15)
    // swiftlint:disable:next multiple_closures_with_trailing_closure
    Button(action: { placeOrder() }) {
      Text("Place Order")
        .foregroundColor(.white)
    }
    .frame(minWidth: 100, maxWidth: 400)
    .frame(height: 45)
    .background(Color.black)
  }
  .padding()
  .navigationBarTitle(Text(lemonade.title), displayMode: .inline)
  .sheet(isPresented: $orderPlaced, onDismiss: nil) {
    OrderPlacedView(lemonade: lemonade)
  }
  .alert(isPresented: $showWarningAlert) {
    Alert(
        title: Text("Whoops! We couldn't place your order."),
        message: Text("Your physical location doesn't match the link you clicked."),
        dismissButton: .default(Text("OK"))
      )
  }
}
}

struct DetailView_Previews: PreviewProvider {
  static var previews: some View {
    DetailView(lemonade: standData[0].menu[0])
  }
}
