//
//  BluetoothPeripheralModel.swift
//  swiftbtarduinocar
//
//  Created by Leonardo Reis on 04/03/20.
//  Copyright © 2020 Leonardo Reis. All rights reserved.
//

import Foundation

struct BluetoothPeripheralModel: Hashable, Codable, Identifiable {
    var id: String
    var name: String
}
