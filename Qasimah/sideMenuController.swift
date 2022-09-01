//
//  sideMenuController.swift
//  Qasimah
//
//  Created by Eslamcr79 on 27/08/2022.
//

import UIKit

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
    
}

struct Setting{
    var settingImage: UIImage!
    var settingTitle: String!
}
