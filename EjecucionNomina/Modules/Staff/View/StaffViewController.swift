//
//  StaffViewController.swift
//  EjecucionNomina
//
//  Created by Gustavo on 22/09/21.
//

import UIKit
import RealmSwift

class StaffViewController: BaseViewController {
    
    @IBOutlet weak var staffDataTable: UITableView!
    
    var presenter = StaffPresenter()
    var isDepartment: Bool?
    var departmentName: String?
    var arrayDepartment: [StaffDataModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
        prepareTable()
    }
    
    func configureViewDepartment(){
        for staff in presenter.staffData {
            if staff.department == departmentName ?? "" {
                arrayDepartment.append(staff)
            }
        }
    }
    
    func prepareTable(){
        staffDataTable.delegate = self
        staffDataTable.dataSource = self
        staffDataTable.register(UINib(nibName: StaffDetailTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: StaffDetailTableViewCell.identifier)
        staffDataTable.tableFooterView = UIView()
    }
    
    func prepareUI(){
        if isDepartment ?? false {
            setupBack(title: "Atras")
        } else {
            setupBackButton(title: "Atras")
        }
        setUpNavBar(title: "Empleados", titleColor: .orange, navBarColor: .white)
    }
}

extension StaffViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (isDepartment ?? false) ? arrayDepartment.count : presenter.staffData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellStaff = tableView.dequeueReusableCell(withIdentifier: StaffDetailTableViewCell.identifier, for: indexPath) as? StaffDetailTableViewCell else { return UITableViewCell() }
        let dataIndex = (isDepartment ?? false) ? arrayDepartment[indexPath.row] : presenter.staffData[indexPath.row]
        cellStaff.configure(data: dataIndex)
        cellStaff.selectionStyle = .none
        return cellStaff
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if !(isDepartment ?? false) {
            guard editingStyle == .delete else { return }
            let dataIndex = presenter.staffData[indexPath.row]
            self.presenter.deteleStaff(staff: dataIndex, table: tableView)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dataIndex = (isDepartment ?? false) ? arrayDepartment[indexPath.row] : presenter.staffData[indexPath.row]
        let vc = NewStaffViewController()
        vc.viewStaff = true
        vc.detailStaffView(data: dataIndex)
        navigationController?.pushViewController(vc, animated: true)
    }
}
