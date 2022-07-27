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
    
    @IBOutlet weak var RegisterButton: UIButton!
    
    @IBOutlet weak var ErrorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styly()
    }
    
    func styly(){
        ErrorLabel.isHidden = true
        Styling.styleTextField(PhoneNumberTextField)
        Styling.styleTextField(EmailTextField)
        Styling.styleFilledButton(RegisterButton)
    }
    
    @IBAction func phoneFieldCheck(_ sender: UITextField) {
        if PhoneNumberTextField.text?.trimmingCharacters(in:.whitespacesAndNewlines) != ""{
            let cleanPhoneNumber = PhoneNumberTextField.text!.trimmingCharacters(in:.whitespacesAndNewlines)
            ErrorLabel.isHidden = true
            if Helper.isValidPhoneNumber(cleanPhoneNumber) {
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
        if EmailTextField.text?.trimmingCharacters(in:.whitespacesAndNewlines) != ""{
            let cleanEmailField = EmailTextField.text!.trimmingCharacters(in:.whitespacesAndNewlines)
            ErrorLabel.isHidden = true
            if Helper.isValidEmail(cleanEmailField){
                ErrorLabel.isHidden = true
            } else {
                ErrorLabel.text = "Please enter valid Email!"
                ErrorLabel.isHidden = false
            }
        }else {
            ErrorLabel.text = "Please enter your Email!"
            ErrorLabel.isHidden = false
        }
    }
    
    @IBAction func RegisterButtonPressed(_ sender: Any) {
        let cleanPhoneNumber = PhoneNumberTextField.text!.trimmingCharacters(in:.whitespacesAndNewlines)
        let cleanEmailField = EmailTextField.text!.trimmingCharacters(in:.whitespacesAndNewlines)
        if PhoneNumberTextField.text?.trimmingCharacters(in:.whitespacesAndNewlines) != ""
            && EmailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) != ""
            && Helper.isValidPhoneNumber(cleanPhoneNumber)
            && Helper.isValidEmail(cleanEmailField)
        {
           RegisterData(PhoneNumber: cleanPhoneNumber, Email: cleanEmailField)
           let PhoneCheckVC = storyboard?.instantiateViewController(identifier: "PCViewController") as? PhoneCheckViewController
           view.window?.rootViewController = PhoneCheckVC
           view.window?.makeKeyAndVisible()
        }
    }
}

extension SignInViewController {
    func RegisterData(PhoneNumber phoneNumber:String,Email email:String) {
        let params: Parameters = [
            "email": email,
            "phone_number": phoneNumber]
        AF.request("https://api-dev.fasttse.com/api/v2/user/register", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).validate().responseDecodable(of: ActivationValidate.self) { response in
            guard let ActivateTTL = response.value else {
                print("Trouble parsing Json!")
                return }
            RegisterUser(PhoneNumber: phoneNumber, Email: email, ActivateValidationTime: ActivateTTL.ActivateValidationTime)
        }
    }
    
}

