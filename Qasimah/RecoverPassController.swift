//
//  RecoverPassController.swift
//  Qasimah
//
//  Created by Jimmy on 22/10/2022.
//

import UIKit

class RecoverPassController: UIViewController, UIGestureRecognizerDelegate {

    
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        backButton.addTarget(self, action: #selector(backToHome), for: .touchUpInside)
        
    }
    
    @IBAction func backToRoot(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

}
