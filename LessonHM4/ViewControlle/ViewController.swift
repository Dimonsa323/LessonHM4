//
//  ViewController.swift
//  LessonHM4
//
//  Created by Дима Губеня on 08.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
//    let userInfo = UserInfo.createUser()
   
    let name = "Dima"
    let password = "Dima7"
    @IBOutlet weak private var textFieldName: UITextField!
    @IBOutlet weak private var textFieldPassword: UITextField!
    
    
    @IBOutlet weak var loginInButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var forgotLoginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction private func forgotPasswordAction() {
        showAlert(with: "Your password", and: "\(password)")
    }
    @IBAction private func forgotLoginAction() {
        showAlert(with: "Your name", and: "\(name)")
    }
    
    @IBAction private func loginAction() {
        guard let inputText = textFieldName.text, !inputText.isEmpty
        else { showAlert(with: "Text field is empty", and: "Enter text")
            return }
        
        if let _ = Double(inputText) {
            showAlert(with: "Wrong Format", and: "Please enter text")
            return }
        
        guard let inputTextPassword = textFieldPassword.text, !inputText.isEmpty
        else { showAlert(with: "Password field is empty", and: "Enter password")
            return }
        
        if let _ = Double(inputTextPassword) {
            showAlert(with: "Wrong Format Password", and: "Please enter password")
            return }
        
        if login() {
         let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "TabBar") as!
            UITabBarController
//            InformationDisplayViewController
//            vc.welcomeLabel = inputText
            vc.modalPresentationStyle = .fullScreen
            navigationController?.present(vc, animated: true)
            
//            let view = InformationDisplayViewController()
//            view.welcomeLabel = textFieldName.text ?? "default"
            
            //self.present(vc, animated: true)
            self.show(vc, sender: self)
        } else {
            showAlert(with: "No", and: "Wrong Format")
        }
    }
    
}
   

    

// MARK: - UIViewController

extension ViewController {
    private func showAlert(with: String, and: String) {
        let showAllert = UIAlertController(title: with, message: and, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.textFieldName.text = ""
            self.textFieldPassword.text = ""
        }
        showAllert.addAction(okAction)
        present(showAllert, animated: true)
    }
}

extension ViewController {
    private func login() -> Bool {
        if textFieldName.text == name &&
            textFieldPassword.text == password {
            return true
        } else { return false}
    }
}



