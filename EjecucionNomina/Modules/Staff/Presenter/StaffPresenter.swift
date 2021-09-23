//
//  StaffPresenter.swift
//  EjecucionNomina
//
//  Created by Gustavo on 22/09/21.
//

import UIKit
import RealmSwift

class StaffPresenter {
    
    var staffData = try! Realm().objects(StaffDataModel.self)
    let realm = try! Realm()
    
    func deteleStaff(staff: StaffDataModel, table: UITableView){
        try! realm.write{
            realm.delete(staff)
        }
        table.reloadData()
    }
}
