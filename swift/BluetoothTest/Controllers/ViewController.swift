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
    
    private var isRunning: Bool = false
    
    @IBOutlet weak var reverseProgressView: UIProgressView!
    @IBOutlet weak var driveProgressView: UIProgressView!
    
    @IBOutlet weak var imageview: UIImageView!
    
    @IBOutlet weak var soundButtom: UIButton! {
        didSet {
            soundButtom.layer.cornerRadius = 19
        }
    }
    @IBOutlet weak var lockUnlockButton: UIButton! {
        didSet {
            lockUnlockButton.layer.cornerRadius = 19
        }
    }
    
    @IBOutlet weak var slider: UISlider! {
        didSet {
            slider.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/2))
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider.setThumbImage(#imageLiteral(resourceName: "thumbImage"), for: .normal)
        slider.setThumbImage(#imageLiteral(resourceName: "thumbImage"), for: .highlighted)
    }
    
    
    // MARK: - View Controller Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.loadingComponent = LoadingComponent()
        
        
         self.communicator = ArduinoCommunicator(delegate: self)
         self.loadingComponent.addLoadingIndicator(to: self.view)
    }
    
    // MARK: - Actions
    func speedUp(_ sender: UIButton) {
        
        // Send code that signifies arduino to update its state
        switch sender.currentTitle {
        case "Down":
            self.communicator.send(value: "B")
        default:
            self.communicator.send(value: "A")
        }
    }
    
    // MARK: - Actions
    @IBAction func controlDirectionSpeed(_ sender: UISlider) {
        let value = sender.value
        
        if value > 0.6 {
            self.communicator.send(value: "B")
        } else if value < 0.4 {
            self.communicator.send(value: "A")
        } else {
            self.communicator.send(value: "C")
        }
        print(value)
    }
    
    func stopAction(_ sender: UIButton) {
        self.communicator.send(value: "C")
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
