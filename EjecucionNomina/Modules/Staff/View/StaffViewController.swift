//
//  StaffViewController.swift
//  EjecucionNomina
//
//  Created by Gustavo on 22/09/21.
//

import UIKit

class StaffViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
    
    func prepareUI(){
        setupBackButton(title: "Atras")
        setUpNavBar(title: "Empleados", titleColor: .orange, navBarColor: .white)
    }
}
