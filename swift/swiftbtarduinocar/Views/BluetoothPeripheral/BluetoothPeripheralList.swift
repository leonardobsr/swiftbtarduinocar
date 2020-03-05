//
//  BluetoothPeripheralList.swift
//  swiftbtarduinocar
//
//  Created by Leonardo Reis on 04/03/20.
//  Copyright © 2020 Leonardo Reis. All rights reserved.
//

import SwiftUI

struct BluetoothPeripheralList: View {
    var body: some View {
        List(bluetoothPeripheralData) { bluetoothPeripheral in
            BluetoothPeripheralRow(bluetoothPeripheral: bluetoothPeripheral)
        }
    }
}

struct BluetoothPeripheralList_Previews: PreviewProvider {
    static var previews: some View {
        BluetoothPeripheralList()
    }
}
