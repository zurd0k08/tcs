//
//  Validations.swift
//  tcsAppJosePablo
//
//  Created by Jose Perez on 20/03/21.
//

import Foundation
import UIKit



class Validations {



public func validateEmail(email: String, label : UILabel, error : String, input : UITextField) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let trimmedString = email.trimmingCharacters(in: .whitespaces)
    let validateEmail = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    let isValidateEmail = validateEmail.evaluate(with: trimmedString)
    
    if isValidateEmail {
       
        label.text = ""
        input.layer.borderColor = UIColor.green.cgColor
        input.layer.borderWidth = 1.0
    }
    else{
        label.text = error
        input.layer.borderColor = UIColor.red.cgColor
        input.layer.borderWidth = 1.0
        
        if input.text!.isEmpty{
            label.text = "Campo vacio"
        }
    }
    
    return isValidateEmail
}

    public func validatePassword(email: String, min: String, label : UILabel, input : UITextField, error : String) -> Bool {
        let passRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{\(min),}$"
        let trimmedString = email.trimmingCharacters(in: .whitespaces)
        let validatePassword = NSPredicate(format:"SELF MATCHES %@", passRegEx)
        let isValidatePass = validatePassword.evaluate(with: trimmedString)
        if isValidatePass {
           
            label.text = ""
            input.layer.borderColor = UIColor.green.cgColor
            input.layer.borderWidth = 1.0
        }
        else{
            label.text = error
            input.layer.borderColor = UIColor.red.cgColor
            input.layer.borderWidth = 1.0
            
            if input.text!.isEmpty{
                label.text = "Campo vacio"
            }
        }
        
        return isValidatePass
    }

}
