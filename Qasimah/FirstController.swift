//
//  ViewController.swift
//  Qasimah
//
//  Created by Eslamcr79 on 28/06/2022.
//

import UIKit

class FirstController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func nextClick(_ sender: Any) {
        let langView = storyboard?.instantiateViewController(withIdentifier: "langView") as! LanguageController
        langView.modalPresentationStyle = .fullScreen
        present(langView, animated: true)
    }
    
}

