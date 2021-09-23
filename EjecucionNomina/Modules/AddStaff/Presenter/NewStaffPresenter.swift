//
//  NewStaffPresenter.swift
//  EjecucionNomina
//
//  Created by Gustavo on 22/09/21.
//

import Foundation
import RealmSwift

class NewStaffPresenter{
    
    var dataStaff: StaffData?
    
    func nuevoFormulario(numberStaff: String, name: String, lastName: String, address: String, cellPhone: String, salary: String, department: String){
        let realm = try! Realm()
        try! realm.write{
            let newFor = StaffData()
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
}
