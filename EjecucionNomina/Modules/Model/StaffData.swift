//
//  StaffData.swift
//  EjecucionNomina
//
//  Created by Gustavo on 22/09/21.
//

import UIKit
import RealmSwift

class StaffData: Object{
    @objc dynamic var numberStaff = ""
    @objc dynamic var name = ""
    @objc dynamic var lastName = ""
    @objc dynamic var address = ""
    @objc dynamic var telephoneNumber = ""
    @objc dynamic var salary = ""
    @objc dynamic var department = ""
}
