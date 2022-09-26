//
//  AddCouponController.swift
//  Qasimah
//
//  Created by Eslamcr79 on 02/09/2022.
//

import UIKit
import ACFloatingTextfield_Swift

class AddCouponController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource,UIGestureRecognizerDelegate {

    @IBOutlet weak var brandField: ACFloatingTextfield!
    let pickerBrand = UIPickerView()
    let brands = ["سوني","ابل","اديداس"]
    let arrowbutton = UIButton()
    @IBOutlet weak var backButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrowbutton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        arrowbutton.tintColor = UIColor.darkGray
        arrowbutton.isUserInteractionEnabled = false
        
        pickerBrand.delegate = self
        pickerBrand.dataSource = self
        brandField.inputView = pickerBrand
        brandField.leftView = arrowbutton
        brandField.leftViewMode = .always
        
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        setUpView(backButton)

    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return brands.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return brands[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        brandField.text = brands[row]
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

}
