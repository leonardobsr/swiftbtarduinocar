//
//  SoundButtonComponent.swift
//  BluetoothTest
//
//  Created by Adriano Ramos on 12/03/20.
//  Copyright © 2020 Nicolas Nascimento. All rights reserved.
//

import UIKit

class SoundButtonComponent: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .black
     	layer.masksToBounds = false
        layer.cornerRadius = 19

        addSubviews()
        setupConstraints()
        
     }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupConstraints() {
        setupImage()
    }
    
    private func setupImage() {
        NSLayoutConstraint.activate([
            soundImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            soundImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            soundImage.heightAnchor.constraint(equalToConstant: 20),
            soundImage.widthAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    let shadows: UIView = {
        var shadow = UIView()
        shadow.clipsToBounds = false
        
        return shadow
    }()
    
    let soundImage: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "sound")
        
        return image
    }()
    
    private func addSubviews() {
//        addSubview(shadows)
        self.addSubview(soundImage)
    }
}

