
//
//  LemonadeClipModel.swift
//  OrderLemonadeAppClip
//
//  Created by Gowtham Namuri on 01/11/21.
//

import Foundation

class LemonadeClipModel: ObservableObject {
    @Published var selectedStand: LemonadeStand?
    @Published var locationFound = true
    @Published var paymentAllowed = true
}
