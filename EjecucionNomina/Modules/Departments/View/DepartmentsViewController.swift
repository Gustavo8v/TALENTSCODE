//
//  DepartmentsViewController.swift
//  EjecucionNomina
//
//  Created by Gustavo on 22/09/21.
//

import UIKit

class DepartmentsViewController: BaseViewController {
    
    @IBOutlet weak var departmentsTable: UITableView!
    
    var presenter = DepartmentsPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
    
    func prepareUI(){
        setupBackButton(title: "Atras")
        setUpNavBar(title: "Departamentos", titleColor: .orange, navBarColor: .white)
        departmentsTable.delegate = self
        departmentsTable.dataSource = self
        departmentsTable.tableFooterView = UIView()
    }
}

extension DepartmentsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.departmentData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "myCell")
        let indexDeparment = presenter.departmentData[indexPath.row]
        cell.textLabel?.text = indexDeparment.department
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexDeparment = presenter.departmentData[indexPath.row]
        let vc = StaffViewController()
        vc.departmentName = indexDeparment.department
        vc.isDepartment = true
        vc.configureViewDepartment()
        navigationController?.pushViewController(vc, animated: true)
    }
}
