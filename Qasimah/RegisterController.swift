//
//  RegisterController.swift
//  Qasimah
//
//  Created by Eslamcr79 on 02/07/2022.
//

import UIKit
import ACFloatingTextfield_Swift
class RegisterController: UIViewController {

    @IBOutlet weak var nametext: ACFloatingTextfield!
    @IBOutlet weak var emailtext: ACFloatingTextfield!
    @IBOutlet weak var passwordtext: ACFloatingTextfield!
    @IBOutlet weak var faceButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    var activeTextField: UITextField? = nil
    let eyebutton = eyeSecureButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        let buttons = [faceButton,googleButton]
        for button in buttons as! [UIButton] {
            button.layer.cornerRadius = 4
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.lightGray.cgColor
           }
            nametext.placeholder = "الاسم بالكامل"
            emailtext.placeholder = "البريد الالكتروني"
            passwordtext.placeholder = "كلمة المرور"
        let textfields = [nametext,emailtext,passwordtext]
            for textfield in textfields as! [ACFloatingTextfield] {
                textfield.lineColor = UIColor.lightGray
                textfield.selectedLineColor = UIColor.black
                textfield.placeHolderColor = UIColor.lightGray
                textfield.selectedPlaceHolderColor = UIColor.black
                textfield.borderStyle = .none
            }
        eyebutton.passwordTextField = passwordtext
        passwordtext.isSecureTextEntry = true
        passwordtext.leftView = eyebutton
        passwordtext.leftViewMode = .always
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}
        

