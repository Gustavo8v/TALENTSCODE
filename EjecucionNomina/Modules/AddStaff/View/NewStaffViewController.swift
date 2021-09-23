//
//  NewStaffViewController.swift
//  EjecucionNomina
//
//  Created by Gustavo on 22/09/21.
//

import UIKit
import Material

protocol NewStaffViewControllerDelegate: class {
    func showSuccessFull(newStaff: Bool)
}

class NewStaffViewController: BaseViewController {
    
    @IBOutlet private weak var numberStaffTextField: TextField!
    @IBOutlet private weak var nameStaff: TextField!
    @IBOutlet private weak var lastNameStaff: TextField!
    @IBOutlet private weak var addressSatff: TextField!
    @IBOutlet private weak var cellPhoneStaff: TextField!
    @IBOutlet private weak var salaryStaff: TextField!
    @IBOutlet private weak var departmentStaff: TextField!
    @IBOutlet private weak var addStaffButton: UIButton!
    
    var presenter = NewStaffPresenter()
    weak var delegate: NewStaffViewControllerDelegate?
    var viewStaff = false
    var dataStaff: StaffDataModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
    
    func detailStaffView(data: StaffDataModel){
        dataStaff = data
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
            self.actionRightButton(title: "Editar")
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
        salaryStaff.keyboardType = .asciiCapableNumberPad
        departmentStaff.prepareStyles()
        textFieldShouldReturn(departmentStaff)
        addStaffButton.setCornerRadius(corner: 16)
    }
    
    func actionRightButton(title: String) {
        let doneItem = UIBarButtonItem(title: title, style: UIBarButtonItem.Style.done, target: self, action: #selector(navBarAction))
        doneItem.tintColor = .orange
        navigationItem.rightBarButtonItem = doneItem
    }
    
    @objc func navBarAction(){
        numberStaffTextField.editText()
        nameStaff.editText()
        lastNameStaff.editText()
        addressSatff.editText()
        cellPhoneStaff.editText()
        salaryStaff.editText()
        departmentStaff.editText()
        addStaffButton.isHidden = false
        addStaffButton.setTitle("Confirmar", for: .normal)
        actionRightButton(title: "")
    }
    
    func addNewStaff(){
        var validationDepartment: Bool?
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
            guard let salaryResult = presenter.departmentData.filter("department = '\(department)'").first?.salary,
                  let salaryText = Int(salary),
                  let salaryFull = Int(salaryResult) else { return }
            let totalSalary = salaryText + salaryFull
            presenter.newStaff(numberStaff: numberStaff,
                               name: name,
                               lastName: lastName,
                               address: addressSatff,
                               cellPhone: cellPhone,
                               salary: salary,
                               department: department)
            presenter.editDepartment(deparment: department, salary: totalSalary.description)
            dismiss(animated: true) {
                self.delegate?.showSuccessFull(newStaff: true)
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
                self.presenter.newDepartment(department: department, salary: salary)
                self.dismiss(animated: true) {
                    self.delegate?.showSuccessFull(newStaff: true)
                }
            }
        }
    }
    
    func editStaff(){
        var validationDepartment: Bool?
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
        if dataStaff?.numberStaff != numberStaff {
            for stafftList in presenter.staffData {
                if stafftList.numberStaff == numberStaff {
                    self.showAlertController(title: "", message: "El número de empleado introducido ya existe", addCancel: false)
                    return
                }
            }
        }
        if validationDepartment ?? false {
            presenter.editStaff(numberStaff: numberStaff,
                                name: name,
                                lastName: lastName,
                                address: addressSatff,
                                cellPhone: cellPhone,
                                salary: salary,
                                department: department)
            dismiss(animated: true) {
                self.delegate?.showSuccessFull(newStaff: false)
            }
        } else {
            self.showAlertController(title: "", message: "El Departamento introducido no coincide con ningún área de anteriores registros, ¿Desea agregar un nuevo Departamento?", addCancel: true) { action in
                self.presenter.editStaff(numberStaff: numberStaff,
                                         name: name,
                                         lastName: lastName,
                                         address: addressSatff,
                                         cellPhone: cellPhone,
                                         salary: salary,
                                         department: department)
                self.presenter.newDepartment(department: department, salary: salary)
                self.dismiss(animated: true) {
                    self.delegate?.showSuccessFull(newStaff: false)
                }
            }
        }
    }
    
    @IBAction func onClickAddStaff(_ sender: Any) {
        if viewStaff {
            editStaff()
        } else {
            addNewStaff()
        }
    }
}
