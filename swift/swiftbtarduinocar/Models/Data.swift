//
//  Data.swift
//  swiftbtarduinocar
//
//  Created by Leonardo Reis on 04/03/20.
//  Copyright © 2020 Leonardo Reis. All rights reserved.
//

import Foundation

let bluetoothPeripheralData: [BluetoothPeripheralModel] = load("bluetoothPeripheralData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
