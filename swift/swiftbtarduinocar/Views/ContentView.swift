//
//  ContentView.swift
//  swiftbtarduinocar
//
//  Created by Leonardo Reis on 04/03/20.
//  Copyright © 2020 Leonardo Reis. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            BluetoothPeripheralList()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
