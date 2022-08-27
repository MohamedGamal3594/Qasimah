//
//  LoginController.swift
//  Qasimah
//
//  Created by Eslamcr79 on 02/07/2022.
//

import UIKit
import ACFloatingTextfield_Swift

class LoginController: UIViewController {

    @IBOutlet weak var facebutton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var emailText: ACFloatingTextfield!
    @IBOutlet weak var passwordText: ACFloatingTextfield!
    @IBOutlet weak var skipButton: UIButton!
    let eyebutton = eyeSecureButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        let buttons = [facebutton,googleButton]
        for button in buttons as! [UIButton] {
            button.layer.cornerRadius = 4
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.lightGray.cgColor
        }
        skipButton.addTarget(self, action: #selector(goToHome), for: .touchUpInside)
            emailText.placeholder = "البريد الالكتروني"
            passwordText.placeholder = "كلمة المرور"
            
        let textfields = [emailText,passwordText]
            
        for textfield in textfields as! [ACFloatingTextfield] {
                    textfield.lineColor = UIColor.lightGray
                    textfield.selectedLineColor = UIColor.black
                    textfield.placeHolderColor = UIColor.lightGray
                    textfield.selectedPlaceHolderColor = UIColor.black
                    textfield.borderStyle = .none
                }
        eyebutton.passwordTextField = passwordText
        passwordText.isSecureTextEntry = true
        passwordText.leftView = eyebutton
        passwordText.leftViewMode = .always
        
    }
    @IBAction func registerClick(_ sender: Any) {
        let registerView = storyboard?.instantiateViewController(withIdentifier: "registerView") as! RegisterController

     registerView.modalPresentationStyle = .fullScreen
     present(registerView, animated: true)
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }


}

