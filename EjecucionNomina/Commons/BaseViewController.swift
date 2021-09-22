//
//  BaseViewController.swift
//  EjecucionNomina
//
//  Created by Gustavo on 22/09/21.
//

import UIKit

class BaseViewController: UIViewController {
    
    func setUpNavBar(title: String?, titleColor: UIColor?, navBarColor: UIColor?) {
        self.title = title
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: titleColor]
        self.navigationController?.navigationBar.tintColor = titleColor
        self.navigationController?.navigationBar.barTintColor = navBarColor
    }
    
    func setupBackButton(title: String) {
        let doneItem = UIBarButtonItem(title: title, style: UIBarButtonItem.Style.done, target: self, action: #selector(dismissView))
        doneItem.tintColor = .orange
        navigationItem.leftBarButtonItem = doneItem
    }
    
    @objc func dismissView (){
        self.dismiss(animated: true, completion: nil)
    }
    
    func popViewController(view: UIViewController){
        let vc = UINavigationController.init(rootViewController: view)
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true, completion: nil)
    }
}
