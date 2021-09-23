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
}
