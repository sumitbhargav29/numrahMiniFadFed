//
//  HomeVC.swift
//  numrahMiniFadFed
//
//  Created by SamMac on 27/10/24.
//

import UIKit

class HomeVC: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var lblHeaderTitle: UILabel!
    @IBOutlet weak var lblSubHeaderTitle: UILabel!
    
    @IBOutlet weak var btnMale: UIButton!
    @IBOutlet weak var btnEveryone: UIButton!
    @IBOutlet weak var btnFemale: UIButton!
    
    @IBOutlet weak var iconMen: UIImageView!
    @IBOutlet weak var iconEveryone: UIImageView!
    @IBOutlet weak var iconFemale: UIImageView!
    
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set default rounded corners
        setupViewRounding()
        
        // Initially, no selection, so reset both views
        resetSelection()
        
    }
    
    //MARK: - Custom Functions
    func setupViewRounding() {
        iconMen.layer.cornerRadius = iconMen.frame.height / 2
        iconEveryone.layer.cornerRadius = iconEveryone.frame.height / 2
        iconFemale.layer.cornerRadius = iconFemale.frame.height / 2
        
        iconMen.layer.borderWidth = 1.5
        iconEveryone.layer.borderWidth = 1.5
        iconFemale.layer.borderWidth = 1.5
        
    }
    
    // Reset the selection colors
    func resetSelection() {
        iconMen.layer.borderColor = UIColor.clear.cgColor
        iconEveryone.layer.borderColor = UIColor.clear.cgColor
        iconFemale.layer.borderColor = UIColor.clear.cgColor
    }
    
    
}


//MARK: - IBActions
extension HomeVC {
    
    @IBAction func btnMaleSelectOnClick(_ sender: UIButton) {
        resetSelection()  // Reset the colors
        iconMen.layer.borderColor = UIColor.clrViewOuterGender.cgColor   // Set the selected color for men
    }
    
    @IBAction func btnEveryoneSelectOnClick(_ sender: UIButton) {
        resetSelection()  // Reset the colors
        iconEveryone.layer.borderColor = UIColor.clrViewOuterGender.cgColor   // Set the selected color for Everyone
    }
    
    @IBAction func btnFemaleSelectOnClick(_ sender: UIButton) {
        resetSelection()  // Reset the colors
        iconFemale.layer.borderColor = UIColor.clrViewOuterGender.cgColor   // Set the selected color for women
    }
    
    @IBAction func btnSearchMatchOnClick(_ sender: UIButton) {
        if let vc = MainInStoryboard.instantiateViewController(withIdentifier: idSearchVCPopUp) as? SearchVCPopUp {
            sceneDelegate?.appNavigation?.present(vc, animated: true)
        }
    }
    
}
