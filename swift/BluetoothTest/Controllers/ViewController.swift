//
//  ViewController.swift
//  BluetoothTest
//
//  Created by Nicolas Nascimento on 15/12/17.
//  Copyright © 2017 Nicolas Nascimento. All rights reserved.
//

import UIKit
import CoreBluetooth

final class ViewController: UIViewController {
    // MARK: - Private Properties
    private var communicator: ArduinoCommunicator!
    
    private var loadingComponent: LoadingComponent!
    
    @IBOutlet weak var reverseProgressView: UIProgressView!
    @IBOutlet weak var driveProgressView: UIProgressView!
    // MARK: - View Controller Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.loadingComponent = LoadingComponent()
        
        // self.communicator = ArduinoCommunicator(delegate: self)
        
        // self.loadingComponent.addLoadingIndicator(to: self.view)
    }
    
    // MARK: - Actions
    @IBAction func updateTrafficLight(_ sender: UIButton) {
        
        // Send code that signifies arduino to update its state
        switch sender.currentTitle {
        case "Down":
            self.communicator.send(value: "B")
        case "Stop":
            self.communicator.send(value: "C")
        default:
            self.communicator.send(value: "A")
        }
    }
    
    // MARK: - Actions
    @IBAction func controlDirectionSpeed(_ sender: UISlider) {
        let value = UInt8(_: sender.value)
        print(value)
    }
}

extension ViewController: ArduinoCommunicatorDelegate {
    func communicatorDidConnect(_ communicator: ArduinoCommunicator) {
        self.loadingComponent.removeLoadingIndicators(from: self.view)
    }
    func communicator(_ communicator: ArduinoCommunicator, didRead data: Data) {
        print(#function)
        print(String(data: data, encoding: .utf8) ?? "No Data")
    }
    func communicator(_ communicator: ArduinoCommunicator, didWrite data: Data) {
        print(#function)
        print(String(data: data, encoding: .utf8) ?? "No Data")
    }
}
