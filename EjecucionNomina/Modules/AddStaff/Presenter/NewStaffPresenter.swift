//
//  NewStaffPresenter.swift
//  EjecucionNomina
//
//  Created by Gustavo on 22/09/21.
//

import Foundation
import RealmSwift

class NewStaffPresenter{
    
    let realm = try! Realm()
    var dataStaff: StaffDataModel?
    var dataDepartment: DepartmentsDataModel?
    var staffData = try! Realm().objects(StaffDataModel.self)
    var departmentData = try! Realm().objects(DepartmentsDataModel.self)
    
    func newStaff(numberStaff: String, name: String, lastName: String, address: String, cellPhone: String, salary: String, department: String){
        try! realm.write{
            let newFor = StaffDataModel()
            newFor.numberStaff = numberStaff
            newFor.name = name
            newFor.lastName = lastName
            newFor.address = address
            newFor.telephoneNumber = cellPhone
            newFor.salary = salary
            newFor.department = department
            realm.add(newFor)
            dataStaff = newFor
        }
    }
    
    func newDepartment(department: String, salary: String){
        try! realm.write{
            let newFor = DepartmentsDataModel()
            newFor.department = department
            newFor.salary = salary
            realm.add(newFor)
            dataDepartment = newFor
        }
    }
    
    func editDepartment(deparment: String, salary: String){
        let editDepartment = departmentData.filter("department == '\(deparment)'").first
        try! realm.write{
            editDepartment?.salary = salary
        }
    }
    
    func editStaff(numberStaff: String, name: String, lastName: String, address: String, cellPhone: String, salary: String, department: String){
        let editStaff = staffData.filter("numberStaff == '\(numberStaff)'").first
        try! realm.write{
            editStaff?.numberStaff = numberStaff
            editStaff?.name = name
            editStaff?.lastName = lastName
            editStaff?.address = address
            editStaff?.telephoneNumber = cellPhone
            editStaff?.salary = salary
            editStaff?.department = department
        }
    }
}
