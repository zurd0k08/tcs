//
//  inputTextView.swift
//  tcsAppJosePablo
//
//  Created by Jose Perez on 20/03/21.
//

import UIKit

enum typeKeyboard {
    case password
    case email
}

class inputTextView: UIView {

    @IBOutlet weak var titleTxtLbl: UILabel!
    @IBOutlet weak var inputTxtField: UITextField!
    @IBOutlet weak var errorTxtLbl: UILabel!
    var typeValidation : typeKeyboard?
    
    var validation = false
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit(){
        let viewFromXib = Bundle.main.loadNibNamed("inputTextView", owner: self, options: nil)![0] as! UIView
        viewFromXib.frame = self.bounds
        addSubview(viewFromXib)
    }
    
    @IBAction func validateInputTxtField(_ sender: Any) {
        
        switch typeValidation{
        case .email :
            validation = Validations().validateEmail(email: inputTxtField.text ?? "", label: errorTxtLbl, error: "no tiene formato de correo", input: inputTxtField)
            break
        case .some(.password):
            validation = Validations().validatePassword(email: inputTxtField.text ?? "", min: "8", label: errorTxtLbl, input: inputTxtField, error: "La contraseña debe tener por lo menos 8 caracteres, letras y numeros")
            break
        case .none:
            break
        }
       
    }
    
    
    func configureInput(title:String, typeKeyboard : typeKeyboard){
        typeValidation = typeKeyboard
        titleTxtLbl.text = title
        
        switch typeKeyboard {
        case .email:
            inputTxtField.keyboardType = .emailAddress
            inputTxtField.isSecureTextEntry = false
            break
        case .password:
            inputTxtField.keyboardType = .default
            inputTxtField.isSecureTextEntry = true
            break
        default:
            inputTxtField.keyboardType = .default
        }
    }
    
    
}
