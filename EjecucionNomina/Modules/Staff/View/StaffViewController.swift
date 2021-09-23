//
//  StaffViewController.swift
//  EjecucionNomina
//
//  Created by Gustavo on 22/09/21.
//

import UIKit
import RealmSwift

class StaffViewController: BaseViewController {
    
    var staffData = try! Realm().objects(StaffData.self)

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
    
    func prepareUI(){
        setupBackButton(title: "Atras")
        setUpNavBar(title: "Empleados", titleColor: .orange, navBarColor: .white)
    }
}
