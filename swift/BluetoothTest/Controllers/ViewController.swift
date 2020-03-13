import UIKit
import CoreBluetooth

final class ViewController: CustomNavigationController {
    // MARK: - Private Properties
    private var communicator: ArduinoCommunicator!
    private var loadingComponent: LoadingComponent!
    
    private var isRunning: Bool = false
    
    @IBOutlet weak var reverseProgressView: UIProgressView!
    @IBOutlet weak var driveProgressView: UIProgressView!
    @IBOutlet weak var soundBtn: UIButton!
    @IBOutlet weak var lockBtn: UIButton!
    
    @IBOutlet weak var imageview: UIImageView!
    
    @IBOutlet weak var soundButtom: UIButton! {
        didSet {
            soundButtom.layer.cornerRadius = 19
//            soundButtom.applyGradient(colours: [.yellow, .blue])
//            soundButtom.applyGradient(colours: [.yellow, .blue, .red], locations: [0.0, 0.5, 1.0])
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
        
        
        lockBtn.setImage(#imageLiteral(resourceName: "unlocked"), for: .normal)
        lockBtn.setImage(#imageLiteral(resourceName: "lock"), for: .selected)
        
        slider.setThumbImage(#imageLiteral(resourceName: "thumbImage"), for: .normal)
        slider.setThumbImage(#imageLiteral(resourceName: "thumbImage"), for: .highlighted)
    }
    
    @IBAction func lockTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2, delay: 0.01, options: .curveLinear, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        }) { (success) in
            UIView.animate(withDuration: 0.2, delay: 0.01, options: .curveLinear, animations: {
                sender.isSelected = !sender.isSelected
                sender.transform = .identity
            }, completion: nil)
        }
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
    
    private func setupButtonBackground() {
        self.soundBtn.applyGradient(colours: [.yellow, .blue])
        self.soundBtn.applyGradient(colours: [.yellow, .blue, .red], locations: [0.0, 0.5, 1.0])
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
