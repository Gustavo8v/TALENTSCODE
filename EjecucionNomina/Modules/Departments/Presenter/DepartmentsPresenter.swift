//
//  DepartmentsPresenter.swift
//  EjecucionNomina
//
//  Created by Gustavo on 23/09/21.
//

import UIKit
import RealmSwift

class DepartmentsPresenter{
    
    var departmentData = try! Realm().objects(DepartmentsDataModel.self)
    
    func deleteDepartment(staff: DepartmentsDataModel, table: UITableView){
        let realm = try! Realm()
        try! realm.write{
            realm.delete(staff)
        }
        table.reloadData()
    }
}
