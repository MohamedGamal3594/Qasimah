//
//  ProfileController.swift
//  Qasimah
//
//  Created by Eslamcr79 on 01/09/2022.
//

import UIKit
import ACFloatingTextfield_Swift
import SideMenuSwift

class ProfileController: UIViewController, UIGestureRecognizerDelegate {
    let eyeButton = eyeSecureButton()
    @IBOutlet weak var nameField: ACFloatingTextfield!
    @IBOutlet weak var emailField: ACFloatingTextfield!
    @IBOutlet weak var backButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.placeholder = "الاسم بالكامل"
        emailField.placeholder = "البريد الالكتروني"
        let textfields = [nameField,emailField]
            for textfield in textfields as! [ACFloatingTextfield] {
                textfield.lineColor = UIColor.lightGray
                textfield.selectedLineColor = UIColor.black
                textfield.placeHolderColor = UIColor.lightGray
                textfield.selectedPlaceHolderColor = UIColor.black
                textfield.borderStyle = .none
    }
     
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        setUpView(backButton)
}
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}


