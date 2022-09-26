//
//  sideMenuController.swift
//  Qasimah
//
//  Created by Eslamcr79 on 27/08/2022.
//

import UIKit
import SideMenuSwift

class sideMenuController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var settingsTable: UITableView!
    let settings:[Setting] = [Setting(settingImage: UIImage(named: "home"), settingTitle: "الرئيسية"),Setting(settingImage: UIImage(named: "deal"), settingTitle: "اقوي العروض"),Setting(settingImage: UIImage(named: "favourit"), settingTitle: "المفضلة"),Setting(settingImage: UIImage(named: "notification"), settingTitle: "الاشعارات"),Setting(settingImage: UIImage(named: "coupons-1"), settingTitle: "كوبونات مستعملة"),Setting(settingImage: UIImage(named: "rate_us"), settingTitle: "قيم التطبيق"),Setting(settingImage: UIImage(named: "coupons"), settingTitle: "اقترح علينا كوبون"),Setting(settingImage: UIImage(named: "help_us"), settingTitle: "قسم المساعدة"),Setting(settingImage: UIImage(named: "exit"), settingTitle: "تسجيل الخروج")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        settingsTable.delegate = self
        settingsTable.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell") as! settingCell
        let data = settings[indexPath.row]
        cell.settingLabel.text = data.settingTitle
        cell.settingImage.image = data.settingImage
        
        return cell
    }
    
    func areSame(class1: AnyObject!,class2: AnyObject!) -> Bool{
        return object_getClassName(class1) == object_getClassName(class2)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nav = sideMenuController?.contentViewController as! UINavigationController
        var view: UIViewController?
        
        if indexPath.row == 0{
            nav.popToRootViewController(animated: true)
            sideMenuController?.hideMenu(animated: true, completion: nil)
        }
        else{
        switch indexPath.row{
            case 1:
                view = storyboard?.instantiateViewController(withIdentifier: "bestView") as! BestOffersController
                break
            case 6:
            view = storyboard?.instantiateViewController(withIdentifier: "addView") as! AddCouponController
                break
            case 7:
                view = storyboard?.instantiateViewController(withIdentifier: "helpView") as! HelpController
                break
            default: break
            }
            sideMenuController?.hideMenu(animated: true, completion: nil)
            if !(areSame(class1: nav.topViewController, class2: view)){
                nav.pushViewController(view!, animated: true)
            }
        }
        

    }
    
    @IBAction func goToProfile(_ sender: Any) {
        let nav = sideMenuController?.contentViewController as! UINavigationController
        let view = storyboard?.instantiateViewController(withIdentifier: "profileView") as! ProfileController
        sideMenuController?.hideMenu(animated: true, completion: nil)
        if !(areSame(class1: nav.topViewController, class2: ProfileController())) && !(areSame(class1: nav.topViewController, class2: ChangePasswordController())){
            nav.pushViewController(view, animated: true)}
    }
}

struct Setting{
    var settingImage: UIImage!
    var settingTitle: String!
}
