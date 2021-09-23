//
//  NewStaffViewController.swift
//  EjecucionNomina
//
//  Created by Gustavo on 22/09/21.
//

import UIKit
import Material

protocol NewStaffViewControllerDelegate: class {
    func showSuccessFull()
}

class NewStaffViewController: BaseViewController {
    
    @IBOutlet weak var numberStaffTextField: TextField!
    @IBOutlet weak var nameStaff: TextField!
    @IBOutlet weak var lastNameStaff: TextField!
    @IBOutlet weak var addressSatff: TextField!
    @IBOutlet weak var cellPhoneStaff: TextField!
    @IBOutlet weak var salaryStaff: TextField!
    @IBOutlet weak var departmentStaff: TextField!
    @IBOutlet weak var addStaffButton: UIButton!
    
    var presenter = NewStaffPresenter()
    weak var delegate: NewStaffViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
    
    func prepareUI(){
        setupBackButton(title: "Atras")
        setUpNavBar(title: "Añade Empleado", titleColor: .orange, navBarColor: .white)
        numberStaffTextField.delegate = self
        nameStaff.delegate = self
        lastNameStaff.delegate = self
        addressSatff.delegate = self
        cellPhoneStaff.delegate = self
        salaryStaff.delegate = self
        departmentStaff.delegate = self
        numberStaffTextField.prepareStyles()
        textFieldShouldReturn(numberStaffTextField)
        nameStaff.prepareStyles()
        textFieldShouldReturn(nameStaff)
        lastNameStaff.prepareStyles()
        textFieldShouldReturn(lastNameStaff)
        addressSatff.prepareStyles()
        textFieldShouldReturn(addressSatff)
        cellPhoneStaff.prepareStyles()
        textFieldShouldReturn(cellPhoneStaff)
        salaryStaff.prepareStyles()
        textFieldShouldReturn(salaryStaff)
        departmentStaff.prepareStyles()
        textFieldShouldReturn(departmentStaff)
        addStaffButton.setCornerRadius(corner: 16)
    }
    
    func addNewStaff(){
        guard let numberStaff = numberStaffTextField.text,
              let name = nameStaff.text,
              let lastName = lastNameStaff.text,
              let addressSatff = addressSatff.text,
              let cellPhone = cellPhoneStaff.text,
              let salary = salaryStaff.text,
              let department = departmentStaff.text else {
            self.showAlertController(title: "", message: "Debe llenar todos los campos")
            return
        }
        presenter.nuevoFormulario(numberStaff: numberStaff,
                                  name: name,
                                  lastName: lastName,
                                  address: addressSatff,
                                  cellPhone: cellPhone,
                                  salary: salary,
                                  department: department)
    }
    
    @IBAction func onClickAddStaff(_ sender: Any) {
        addNewStaff()
        delegate?.showSuccessFull()
        dismiss(animated: true) {
            self.delegate?.showSuccessFull()
        }
    }
}
