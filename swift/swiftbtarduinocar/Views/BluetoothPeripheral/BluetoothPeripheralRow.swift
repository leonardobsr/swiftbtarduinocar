//
//  BluetoothPeripheralRow.swift
//  swiftbtarduinocar
//
//  Created by Leonardo Reis on 04/03/20.
//  Copyright © 2020 Leonardo Reis. All rights reserved.
//

import SwiftUI

struct BluetoothPeripheralRow: View {
    var bluetoothPeripheral: BluetoothPeripheralModel

    var body: some View {
        HStack {
            Text(bluetoothPeripheral.id)
            Text(bluetoothPeripheral.name)
        }
    }
}

struct BluetoothPeripheralRow_Previews: PreviewProvider {
    static var previews: some View {
        BluetoothPeripheralRow(bluetoothPeripheral: bluetoothPeripheralData[0])
    }
}
