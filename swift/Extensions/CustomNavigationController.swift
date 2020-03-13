//
//  CustomNavigationController.swift
//  BluetoothTest
//
//  Created by Adriano Ramos on 13/03/20.
//  Copyright © 2020 Nicolas Nascimento. All rights reserved.
//

import UIKit

class CustomNavigationController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        customNavBar()
    }
    
    private func customNavBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = .black
    }
    
}
