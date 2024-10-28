//
//  SearchVCPopUp.swift
//  numrahMiniFadFed
//
//  Created by SamMac on 29/10/24.
//

import UIKit

class SearchVCPopUp: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var vwCircleLoader: RotatingCircularLoaderView!
    @IBOutlet weak var imgProfilePhoto: UIImageView!
    
    @IBOutlet weak var vwResultFoundOption: UIView!
    @IBOutlet weak var lblPersonName: UILabel!
    @IBOutlet weak var lblPersonLocation: UILabel!
    
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgProfilePhoto.layer.cornerRadius = imgProfilePhoto.frame.height / 2
        imgProfilePhoto.backgroundColor = .white
        
        // Create a blur effect
        let blurEffect = UIBlurEffect(style: .light) // You can choose .extraLight, .light, or .dark
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = imgProfilePhoto.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        imgProfilePhoto.addSubview(blurEffectView)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        vwResultFoundOption.isHidden = true
        
        vwCircleLoader.progressColor = .clrYellow
        vwCircleLoader.trackColor = .clrBackground
        vwCircleLoader.startAnimating()
    }
    
}

//MARK: - IBActions
extension SearchVCPopUp {
    
    // temp button
    @IBAction func btnDismissPopUpOnClick(_ sender: UIButton) {
        sceneDelegate?.appNavigation?.dismiss(animated: true)
    }
    
    // temp button
    @IBAction func btnStopOnClick(_ sender: UIButton) {
        // Hide blur effect
        if let blurEffectView = imgProfilePhoto.subviews.first(where: { $0 is UIVisualEffectView }) {
            blurEffectView.removeFromSuperview()
        }
        vwCircleLoader.stopAnimating()
        vwResultFoundOption.isHidden = false
        vwCircleLoader.isHidden = true
        
    }
    
    @IBAction func btnSkipOnClick(_ sender: UIButton) {
        // Show blur effect
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = imgProfilePhoto.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        imgProfilePhoto.addSubview(blurEffectView)
        
        
        vwResultFoundOption.isHidden = true
        vwCircleLoader.isHidden = false
        
        // Start loader animation
        vwCircleLoader.startAnimating()
    }
    
    @IBAction func btnAcceptOnClick(_ sender: UIButton) {
        
        sceneDelegate?.appNavigation?.dismiss(animated: true) { [weak self] in
            guard let self = self else { return }
            
            let vc = loadVC(strStoryboardId: SB_MAIN, strVCId: idHomePage) as! HomePage
            sceneDelegate?.appNavigation = UINavigationController(rootViewController: vc)
            sceneDelegate?.appNavigation?.interactivePopGestureRecognizer?.delegate = nil
            sceneDelegate?.appNavigation?.interactivePopGestureRecognizer?.isEnabled = true
            sceneDelegate?.appNavigation?.isNavigationBarHidden = true
            sceneDelegate?.window?.rootViewController = sceneDelegate?.appNavigation
            sceneDelegate?.window?.makeKeyAndVisible()
            vc.selectedIndex = 1
        }
    }
    
}

