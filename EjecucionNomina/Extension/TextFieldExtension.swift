//
//  TextFieldExtension.swift
//  EjecucionNomina
//
//  Created by Gustavo on 22/09/21.
//

import Material

extension TextField {
    
    func prepareStyles(){
        self.placeholderActiveColor = .orange
        self.dividerActiveColor = .red
    }
    
    func styleError(){
        self.placeholderActiveColor = .orange
        self.dividerActiveColor = .red
    }
    
    func isEnabbled(){
        self.isEnabled = false
        self.backgroundColor = .lightGray
    }
    
    
    
    @objc func roundCorners(radius: CGFloat) {
        self.layer.cornerRadius = radius
    }
}
