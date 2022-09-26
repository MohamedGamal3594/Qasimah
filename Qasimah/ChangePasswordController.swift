//
//  ChangePasswordController.swift
//  Qasimah
//
//  Created by Eslamcr79 on 01/09/2022.
//

import UIKit
import ACFloatingTextfield_Swift

class ChangePasswordController: UIViewController, UIGestureRecognizerDelegate {
    
    let eyeButton = eyeSecureButton()
    let eyeButton2 = eyeSecureButton()
    let eyeButton3 = eyeSecureButton()
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var currentField: ACFloatingTextfield!
    @IBOutlet weak var newField: ACFloatingTextfield!
    @IBOutlet weak var confirmField: ACFloatingTextfield!
    override func viewDidLoad() {
        super.viewDidLoad()
        let fields:[ACFloatingTextfield] = [currentField,newField,confirmField]
        eyeButton.passwordTextField = currentField
        eyeButton2.passwordTextField = newField
        eyeButton3.passwordTextField = confirmField
        currentField.leftView = eyeButton
        newField.leftView = eyeButton2
        confirmField.leftView = eyeButton3
        currentField.placeholder = "كلمة المرور الحالية"
        newField.placeholder = "كلمة المرور الجديدة"
        confirmField.placeholder = "تاكيد كلمة المرور الجديدة"
        for field in fields {
            field.lineColor = UIColor.lightGray
            field.selectedLineColor = UIColor.black
            field.placeHolderColor = UIColor.lightGray
            field.selectedPlaceHolderColor = UIColor.black
            field.borderStyle = .none
            field.isSecureTextEntry = true
            field.leftViewMode = .always
}
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        setUpView(backButton)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}
