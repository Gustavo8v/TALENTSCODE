//
//  StaffPresenter.swift
//  EjecucionNomina
//
//  Created by Gustavo on 22/09/21.
//

import UIKit
import RealmSwift

class StaffPresenter {
    
    var staffData = try! Realm().objects(StaffData.self)
    
    func deteleStaff(staff: StaffData, table: UITableView){
        let realm = try! Realm()
        try! realm.write{
            realm.delete(staff)
        }
        table.reloadData()
    }
}
