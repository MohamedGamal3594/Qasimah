//
//  eyeSecureButton.swift
//  Qasimah
//
//  Created by Eslamcr79 on 06/07/2022.
//

import UIKit

public class eyeSecureButton: UIButton {
    var passwordTextField: UITextField!
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    init(){
        super.init(frame: .zero)
        self.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        self.tintColor = UIColor.black
        self.addTarget(self, action: #selector(changeSecure), for: .touchUpInside)
    }

    @objc func changeSecure(_ sender: UIButton){
        if passwordTextField.isSecureTextEntry == true{
            self.setImage(UIImage(systemName: "eye"), for: .normal)
        }
        else{
            self.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        }
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }
}
