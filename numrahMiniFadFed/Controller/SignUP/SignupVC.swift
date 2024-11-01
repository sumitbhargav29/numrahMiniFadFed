//
//  SignupVC.swift
//  numrahMiniFadFed
//
//  Created by SamMac on 27/10/24.
//

import UIKit

class SignupVC: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var lblHeaderTitle: UILabel!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var btnMale: UIButton!
    @IBOutlet weak var btnFemale: UIButton!
    @IBOutlet weak var btnContinue: UIButton!
    @IBOutlet weak var iconMen: UIImageView!
    @IBOutlet weak var iconFemale: UIImageView!
    
    private var viewModel = SignUpViewModel()
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        btnContinue.setUnderlinedTitle("استمرارك يعني موافقتك على الشروط والأحكام", for: .normal)
        
        // Set default rounded corners
        setupViewRounding()
        
        // Initially, no selection, so reset both views
        resetSelection()
    }
    
    //MARK: - Custom Functions
    func setupViewRounding() {
        iconMen.layer.cornerRadius = iconMen.frame.height / 2
        iconFemale.layer.cornerRadius = iconFemale.frame.height / 2
        iconMen.layer.borderWidth = 1.5
        iconFemale.layer.borderWidth = 1.5
    }
    
    // Reset the selection colors
    func resetSelection() {
        iconMen.layer.borderColor = UIColor.clear.cgColor
        iconFemale.layer.borderColor = UIColor.clear.cgColor
    }
    
}

//MARK: - IBActions
extension SignupVC {
    @IBAction func btnMaleSelectOnClick(_ sender: UIButton) {
        resetSelection()  // Reset the colors
        iconMen.layer.borderColor = UIColor.clrViewOuterGender.cgColor   // Set the selected color for men
    }
    
    @IBAction func btnFemaleSelectOnClick(_ sender: UIButton) {
        resetSelection()  // Reset the colors
        iconFemale.layer.borderColor = UIColor.clrViewOuterGender.cgColor   // Set the selected color for women
    }
    
    @IBAction func btnContinueOnClick(_ sender: UIButton) {
        
        //        let vc = loadVC(strStoryboardId: SB_MAIN, strVCId: idHomePage) as! HomePage
        //        sceneDelegate?.appNavigation = UINavigationController(rootViewController: vc)
        //        sceneDelegate?.appNavigation?.interactivePopGestureRecognizer?.delegate = nil
        //        sceneDelegate?.appNavigation?.interactivePopGestureRecognizer?.isEnabled = true
        //        sceneDelegate?.appNavigation?.isNavigationBarHidden = true
        //        sceneDelegate?.window?.rootViewController = sceneDelegate?.appNavigation
        //        sceneDelegate?.window?.makeKeyAndVisible()
        
         guard let username = tfName.text, !username.isEmpty else {
            showAlert(AppName, "Please enter username")
            return
        }
        
        // Call the signUp method on the ViewModel
        viewModel.signUp(username: username, password: "123456") { [weak self] success, message in
            guard let self = self else { return }
            
             if success {
                self.showAlert(AppName, "Sign-up successful!")
            } else {
                self.showAlert(AppName, "Error: \(message ?? "Unknown error")")
            }
        }
    }
}
