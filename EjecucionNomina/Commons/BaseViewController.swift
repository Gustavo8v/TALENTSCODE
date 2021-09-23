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
    
    func setupBack(title: String) {
        let doneItem = UIBarButtonItem(title: title, style: UIBarButtonItem.Style.done, target: self, action: #selector(popView))
        doneItem.tintColor = .orange
        navigationItem.leftBarButtonItem = doneItem
    }
    
    @objc func popView (){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func dismissView (){
        self.dismiss(animated: true, completion: nil)
    }
    
    func popViewController(view: UIViewController){
        let vc = UINavigationController.init(rootViewController: view)
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true, completion: nil)
    }
    
    func showAlertController(title:String, message:String,
                             buttons: [UIAlertAction] = [],
                             addContinue: Bool = true,
                             continueHandler: ((UIAlertAction) -> Void)? = nil,
                             addCancel: Bool = true,
                             cancelHandler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        for button in buttons {
            alert.addAction(button)
        }
        if addContinue {
            alert.addAction(UIAlertAction(title: "Cancelar", style: UIAlertAction.Style.default, handler: continueHandler))
        }
        if addCancel {
            alert.addAction(UIAlertAction(title: "Continuar", style: UIAlertAction.Style.default, handler: cancelHandler))
        }
        alert.view.tintColor = .orange
        present(alert, animated:  true)
    }
}

extension BaseViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
