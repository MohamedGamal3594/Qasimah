//
//  HelpController.swift
//  Qasimah
//
//  Created by Eslamcr79 on 02/09/2022.
//

import UIKit
import ACFloatingTextfield_Swift

class HelpController: UIViewController,UIGestureRecognizerDelegate {

    @IBOutlet weak var backButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        setUpView(backButton)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}
