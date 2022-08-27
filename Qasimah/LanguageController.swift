//
//  LanguageController.swift
//  Qasimah
//
//  Created by Eslamcr79 on 02/07/2022.
//

import UIKit

class LanguageController: UIViewController {

    @IBOutlet weak var next2: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func next2Click(_ sender: Any) {
        let registerView = storyboard?.instantiateViewController(withIdentifier: "registerView") as! RegisterController
        registerView.modalPresentationStyle = .fullScreen
        present(registerView, animated: true)
    }
    

}
