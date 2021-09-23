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
    var delegate: NewStaffViewControllerDelegate?
    
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
        cell.detailTextLabel?.text = "Salario total quincenal: $\(indexDeparment.salary)"
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            guard editingStyle == .delete else { return }
        let dataIndex = presenter.departmentData[indexPath.row]
            self.presenter.deleteDepartment(staff: dataIndex, table: tableView)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexDeparment = presenter.departmentData[indexPath.row]
        let vc = StaffViewController()
        vc.delegate = self
        vc.departmentName = indexDeparment.department
        vc.isDepartment = true
        vc.configureViewDepartment()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension DepartmentsViewController: NewStaffViewControllerDelegate {
    func showSuccessFull(newStaff: Bool) {
        delegate?.showSuccessFull(newStaff: newStaff)
    }
}
