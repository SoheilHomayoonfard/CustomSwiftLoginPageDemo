//
//  PhoneCheckViewController.swift
//  firstApp
//
//  Created by Gandom on 7/17/22.
//
import UIKit
import Alamofire

class PhoneCheckViewController: UIViewController {
    
    var counter : Int = 60
    
    var timer : Timer!
    
    @IBOutlet weak var ActivationCodeTextField: UITextField!
    
    @IBOutlet weak var SignUpButton: UIButton!
    
    @IBOutlet weak var ResendButton: UIButton!
    
    @IBOutlet weak var unwindButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        initTimer()
        Styling.styleTextField(ActivationCodeTextField)
        Styling.styleFilledButton(SignUpButton)
        Styling.styleHollowButton(ResendButton)
        Styling.styleFilledButton(unwindButton)
    }
    
    @IBAction func SignUpButtonPressed(_ sender: Any) {
        let MainMenu = storyboard?.instantiateViewController(identifier: "MainMenuVC") as? MainMenuViewController
        view.window?.rootViewController = MainMenu
        view.window?.makeKeyAndVisible()
    }
    
    @IBAction func ResendButtonPressed(_ sender: Any) {
        // change Activation code
        counter = 60
        ResendButton.isEnabled = false
        initTimer()
    }
    
    @IBAction func UnwindButtonPressed(_ sender: Any) {
        let SignInVC = storyboard?.instantiateViewController(identifier: "SignInVC") as? SignInViewController
        view.window?.rootViewController = SignInVC
        view.window?.makeKeyAndVisible()
    }
    
    func initTimer () {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(step), userInfo: nil, repeats: true)
    }
    
    @objc func step(){
        if counter > 0{
            counter -= 1
            ResendButton.setTitle("Resend Activation Code in \(counter)", for: .normal)
        }else{
            timer.invalidate()
            ResendButton.setTitle("Resend Activation Code", for: .normal)
            ResendButton.isEnabled = true
        }
    }
}

extension PhoneCheckViewController {
    func fetchData() {
    }
    
}

