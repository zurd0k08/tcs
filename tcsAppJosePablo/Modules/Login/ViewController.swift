//
//  ViewController.swift
//  tcsAppJosePablo
//
//  Created by Jose Perez on 20/03/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailView: inputTextView!
    @IBOutlet weak var passwordView: inputTextView!
    
    override func viewDidLoad() {
        emailView.configureInput(title: "Email", typeKeyboard: .email)
        passwordView.configureInput(title: "Password", typeKeyboard: .password)
        super.viewDidLoad()
    }
    
    @IBAction func loginAction(_ sender: Any) {
        if emailView.validation && passwordView.validation{
            UserDefaults.standard.set(emailView.inputTxtField.text!, forKey: "username")
            let storyboard = UIStoryboard(name: "transactions", bundle: self.nibBundle)
            let vc = storyboard.instantiateViewController(withIdentifier: "transactionID") as UIViewController
            present(vc, animated: true, completion: nil)
        }
        else {
            AlertImage.shared.showAlertImage(title: "¡Error!", message: "Usuario y/o contraseña incorrectos" , type: .failure, view: self.view, image: "tataLogo")
        }
    }
    
}

