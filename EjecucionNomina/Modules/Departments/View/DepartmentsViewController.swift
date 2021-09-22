//
//  DepartmentsViewController.swift
//  EjecucionNomina
//
//  Created by Gustavo on 22/09/21.
//

import UIKit

class DepartmentsViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
    
    func prepareUI(){
        setupBackButton(title: "Atras")
        setUpNavBar(title: "Departamentos", titleColor: .orange, navBarColor: .white)
    }
}
