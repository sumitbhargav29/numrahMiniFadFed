//
//  SearchVCPopUp.swift
//  numrahMiniFadFed
//
//  Created by SamMac on 29/10/24.
//

import UIKit

class SearchVCPopUp: UIViewController {
    
    @IBOutlet weak var vwCircleLoader: RotatingCircularLoaderView!
    @IBOutlet weak var imgProfilePhoto: UIImageView!
    
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
        vwCircleLoader.progressColor = .clrYellow
        vwCircleLoader.trackColor = .clrBackground
        vwCircleLoader.startAnimating()
    }
    
    @IBAction func btnDismissPopUpOnClick(_ sender: UIButton) {
        sceneDelegate?.appNavigation?.dismiss(animated: true)
    }
    
    @IBAction func btnStopOnClick(_ sender: UIButton) {
        vwCircleLoader.stopAnimating()
    }
    
}
