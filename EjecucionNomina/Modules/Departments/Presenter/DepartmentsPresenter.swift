//
//  DepartmentsPresenter.swift
//  EjecucionNomina
//
//  Created by Gustavo on 23/09/21.
//

import Foundation
import RealmSwift

class DepartmentsPresenter{
    
    var departmentData = try! Realm().objects(DepartmentsModel.self)
    
}
