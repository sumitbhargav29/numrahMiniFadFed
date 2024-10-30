//
//  ChatVC.swift
//  numrahMiniFadFed
//
//  Created by SamMac on 29/10/24.
//

import UIKit

class ChatVC: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var btnReload: UIButton!
    @IBOutlet weak var btnNotification: UIButton!
    @IBOutlet weak var btnAddPeople: UIButton!
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var imgProfilePhoto: UIImageView!
    
    
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnReload.setImage(UIImage(named: "ic_reload"), for: .normal)
        btnReload.setTitle("تجاوز", for: .normal)
        btnReload.setIconAboveTitle(spacing: 2)
        
        btnNotification.setImage(UIImage(named: "ic_info"), for: .normal)
        btnNotification.setTitle("إبلاغ", for: .normal)
        btnNotification.setIconAboveTitle(spacing: 2)
        
        btnAddPeople.setImage(UIImage(named: "ic_addPeople"), for: .normal)
        btnAddPeople.setTitle("إضافة", for: .normal)
        btnAddPeople.setIconAboveTitle(spacing: 2)
    }
    
    
}


//MARK: - IBActions
extension ChatVC {
    
    @IBAction func btnReloadOnClick(_ sender: UIButton) {
        
    }
    
    @IBAction func btnNotificationOnClick(_ sender: UIButton) {
        
    }
    
    @IBAction func btnAddPeopleOnClick(_ sender: UIButton) {
        
    }
    
    @IBAction func btnBackOnClick(_ sender: UIButton) {
        sceneDelegate?.appNavigation?.popViewController(animated: true)
    }
    
}
