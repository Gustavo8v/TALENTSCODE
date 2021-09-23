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
    var viewStaff = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
    
    func detailStaffView(data: StaffData){
        for whiteTextField in view.subviews {
            if let textField = whiteTextField as? TextField {
                textField.isEnabled = false
                textField.backgroundColor = .gray
            }
        }
        numberStaffTextField.text = data.numberStaff
        numberStaffTextField.isEnabbled()
        nameStaff.text = data.name
        nameStaff.isEnabbled()
        lastNameStaff.text = data.lastName
        lastNameStaff.isEnabbled()
        addressSatff.text = data.address
        addressSatff.isEnabbled()
        cellPhoneStaff.text = data.telephoneNumber
        cellPhoneStaff.isEnabbled()
        salaryStaff.text = data.salary
        salaryStaff.isEnabbled()
        departmentStaff.text = data.department
        departmentStaff.isEnabbled()
        addStaffButton.isHidden = true
    }
    
    func prepareUI(){
        let corner = CGFloat(8)
        if viewStaff {
            setupBack(title: "Atras")
        } else {
            setupBackButton(title: "Atras")
        }
        setUpNavBar(title: "Añade Empleado", titleColor: .orange, navBarColor: .white)
        numberStaffTextField.delegate = self
        numberStaffTextField.roundCorners(radius: corner)
        nameStaff.delegate = self
        nameStaff.roundCorners(radius: corner)
        lastNameStaff.delegate = self
        lastNameStaff.roundCorners(radius: corner)
        addressSatff.delegate = self
        addressSatff.roundCorners(radius: corner)
        cellPhoneStaff.delegate = self
        cellPhoneStaff.roundCorners(radius: corner)
        salaryStaff.delegate = self
        salaryStaff.roundCorners(radius: corner)
        departmentStaff.delegate = self
        departmentStaff.roundCorners(radius: corner)
        numberStaffTextField.prepareStyles()
        textFieldShouldReturn(numberStaffTextField)
        numberStaffTextField.keyboardType = .asciiCapableNumberPad
        nameStaff.prepareStyles()
        textFieldShouldReturn(nameStaff)
        lastNameStaff.prepareStyles()
        textFieldShouldReturn(lastNameStaff)
        addressSatff.prepareStyles()
        textFieldShouldReturn(addressSatff)
        cellPhoneStaff.prepareStyles()
        textFieldShouldReturn(cellPhoneStaff)
        cellPhoneStaff.keyboardType = .asciiCapableNumberPad
        salaryStaff.prepareStyles()
        textFieldShouldReturn(salaryStaff)
        departmentStaff.prepareStyles()
        textFieldShouldReturn(departmentStaff)
        addStaffButton.setCornerRadius(corner: 16)
    }
    
    func addNewStaff(){
        var validationDepartment: Bool?
        var validationNumberStaff: Bool?
        guard let numberStaff = numberStaffTextField.text, !numberStaff.isEmpty,
              let name = nameStaff.text, !name.isEmpty,
              let lastName = lastNameStaff.text, !lastName.isEmpty,
              let addressSatff = addressSatff.text, !addressSatff.isEmpty,
              let cellPhone = cellPhoneStaff.text, !cellPhone.isEmpty,
              let salary = salaryStaff.text, !salary.isEmpty,
              let department = departmentStaff.text, !department.isEmpty else {
            self.showAlertController(title: "", message: "Debe llenar todos los campos", addCancel: false)
            return
        }
        for stafftList in presenter.staffData {
            if stafftList.department == department {
                validationDepartment = true
                continue
            }
        }
        for stafftList in presenter.staffData {
            if stafftList.numberStaff == numberStaff {
                self.showAlertController(title: "", message: "El número de empleado introducido ya existe", addCancel: false)
                return
            }
        }
        if validationDepartment ?? false {
            presenter.newStaff(numberStaff: numberStaff,
                               name: name,
                               lastName: lastName,
                               address: addressSatff,
                               cellPhone: cellPhone,
                               salary: salary,
                               department: department)
            presenter.newDepartment(department: department)
            dismiss(animated: true) {
                self.delegate?.showSuccessFull()
            }
        } else {
            self.showAlertController(title: "", message: "El Departamento introducido no coincide con ningún área de anteriores registros, ¿Desea agregar un nuevo Departamento?", addCancel: true) { action in
                self.presenter.newStaff(numberStaff: numberStaff,
                                        name: name,
                                        lastName: lastName,
                                        address: addressSatff,
                                        cellPhone: cellPhone,
                                        salary: salary,
                                        department: department)
                self.presenter.newDepartment(department: department)
                self.dismiss(animated: true) {
                    self.delegate?.showSuccessFull()
                }
            }
        }
    }
    
    @IBAction func onClickAddStaff(_ sender: Any) {
        addNewStaff()
    }
}
