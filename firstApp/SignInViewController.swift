//
//  ViewController.swift
//  firstApp
//
//  Created by Gandom on 7/17/22.
//
import UIKit
import Alamofire

class SignInViewController: UIViewController {
    
    @IBOutlet weak var PhoneNumberTextField: UITextField!
    
    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var RegisterButton: UIButton!
    
    @IBOutlet weak var ErrorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styly()
        fetchData()
    }
    
    func styly(){
        ErrorLabel.isHidden = true
        Styling.styleTextField(PhoneNumberTextField)
        Styling.styleTextField(EmailTextField)
        Styling.styleTextField(PasswordTextField)
        Styling.styleFilledButton(RegisterButton)
    }
    
    @IBAction func phoneFieldCheck(_ sender: UITextField) {
        if PhoneNumberTextField.text?.trimmingCharacters(in:.whitespacesAndNewlines) != ""{
            let cleanPhoneNumber = PhoneNumberTextField.text!.trimmingCharacters(in:.whitespacesAndNewlines)
            ErrorLabel.isHidden = true
            if Helper.isPhoneNumber(cleanPhoneNumber) {
                ErrorLabel.isHidden = true
            } else {
                ErrorLabel.text = "Please enter valid Phone Number!"
                ErrorLabel.isHidden = false
            }
        }else {
            ErrorLabel.text = "Please enter your number!"
            ErrorLabel.isHidden = false
        }
    }
    
    @IBAction func EmailFieldCheck(_ sender: Any) {
        if  EmailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            ErrorLabel.text = "Please enter your email!"
            ErrorLabel.isHidden = false
        }else{
            ErrorLabel.isHidden = true
        }
    }
    
    @IBAction func PasswordFieldCheck(_ sender: Any) {
        if  PasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            ErrorLabel.text = "Please enter your password!"
            ErrorLabel.isHidden = false
        }else{
            ErrorLabel.isHidden = true
        }
    }
    
    @IBAction func RegisterButtonPressed(_ sender: Any) {
        let cleanPhoneNumber = PhoneNumberTextField.text!.trimmingCharacters(in:.whitespacesAndNewlines)
        if PhoneNumberTextField.text?.trimmingCharacters(in:.whitespacesAndNewlines) != ""
            && PasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) != ""
            && EmailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) != ""
            && Helper.isPhoneNumber(cleanPhoneNumber)
        {
                let PhoneCheckVC = storyboard?.instantiateViewController(identifier: "PCViewController") as? PhoneCheckViewController
                view.window?.rootViewController = PhoneCheckVC
                view.window?.makeKeyAndVisible()
        }
    }
}

extension SignInViewController {
    func fetchData() {
        
    }
    
}

