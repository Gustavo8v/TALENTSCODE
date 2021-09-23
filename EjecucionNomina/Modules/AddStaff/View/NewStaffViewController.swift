//
//  NewStaffViewController.swift
//  EjecucionNomina
//
//  Created by Gustavo on 22/09/21.
//

import UIKit
import Material

class NewStaffViewController: BaseViewController {
    
    var presenter = NewStaffPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
    
    func prepareUI(){
        setupBackButton(title: "Atras")
        setUpNavBar(title: "Añade Empleado", titleColor: .orange, navBarColor: .white)
    }
}
