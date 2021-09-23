//
//  HomeViewController.swift
//  EjecucionNomina
//
//  Created by Gustavo on 22/09/21.
//

import UIKit
import NotificationBannerSwift

class HomeViewController: BaseViewController {
    
    @IBOutlet private weak var staffButton: UIButton!
    @IBOutlet private weak var addDepartment: UIButton!
    @IBOutlet private weak var addStaff: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
    
    func prepareUI(){
        staffButton.setCornerRadius(corner: 16)
        addDepartment.setCornerRadius(corner: 16)
        addStaff.setCornerRadius(corner: 16)
    }
    
    @IBAction func onClickAddStaff(_ sender: Any) {
        let vc = NewStaffViewController()
        vc.delegate = self
        popViewController(view: vc)
    }
    
    @IBAction func onClickAddDepartments(_ sender: Any) {
        let vc = DepartmentsViewController()
        vc.delegate = self
        popViewController(view: vc)
    }
    
    @IBAction func onClickGoStaff(_ sender: Any) {
        let vc = StaffViewController()
        vc.delegate = self
        popViewController(view: vc)
    }
}

extension HomeViewController: NewStaffViewControllerDelegate {
    func showSuccessFull(newStaff: Bool) {
        NotificationBanner(title: newStaff ? "¡Guardado!" : "¡Actualizado!",
                           subtitle: newStaff ? "Los datos del nuevo empleado se han guardado con éxito" : "Los datos del nuevo empleado se han actualizado con éxito",
                           style: .success).show()
    }
}
