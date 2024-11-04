//
//  SearchVCPopUp.swift
//  numrahMiniFadFed
//
//  Created by SamMac on 29/10/24.
//

import UIKit

class SearchVCPopUp: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var vwCircleLoader: RotatingCircularLoaderView!
    @IBOutlet weak var imgProfilePhoto: UIImageView!
    
    @IBOutlet weak var vwResultFoundOption: UIView!
    @IBOutlet weak var lblPersonName: UILabel!
    @IBOutlet weak var lblPersonLocation: UILabel!
    
    
    private var savedDeviceID: String? {
        return UserDefaults.standard.string(forKey: "DeviceID")
    }
    
    private var savedSessionID: String? {
        return UserDefaults.standard.string(forKey: "SessionID")
    }
    
    private var saveduserToken: String? {
        return UserDefaults.standard.string(forKey: "userToken")
    }
    
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProfilePhoto()
        
        
        // emp calling socket connect meethod
        let socketManager = SocketIOManager.shared
        socketManager.connect()
 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupLoader()
    }
    
    // MARK: - Setup Methods
    private func setupProfilePhoto() {
        imgProfilePhoto.layer.cornerRadius = imgProfilePhoto.frame.height / 2
        imgProfilePhoto.backgroundColor = .white
        addBlurEffectToProfilePhoto()
    }
    
    private func addBlurEffectToProfilePhoto() {
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = imgProfilePhoto.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        imgProfilePhoto.addSubview(blurEffectView)
    }
    
    private func setupLoader() {
        vwResultFoundOption.isHidden = true
        vwCircleLoader.progressColor = .clrYellow
        vwCircleLoader.trackColor = .clrBackground
        vwCircleLoader.startAnimating()
    }
}

// MARK: - IBActions
extension SearchVCPopUp {
    
    @IBAction func btnDismissPopUpOnClick(_ sender: UIButton) {
        sceneDelegate?.appNavigation?.dismiss(animated: true)
    }
    
    @IBAction func btnStopOnClick(_ sender: UIButton) {
        stopLoader()
    }
    
    @IBAction func btnSkipOnClick(_ sender: UIButton) {
        restartLoader()
    }
    
    @IBAction func btnAcceptOnClick(_ sender: UIButton) {
        navigateToHomePage()
    }
    
    // MARK: - Loader Control
    private func stopLoader() {
        removeBlurEffectFromProfilePhoto()
        vwCircleLoader.stopAnimating()
        vwResultFoundOption.isHidden = false
        vwCircleLoader.isHidden = true
    }
    
    private func restartLoader() {
        addBlurEffectToProfilePhoto()
        vwResultFoundOption.isHidden = true
        vwCircleLoader.isHidden = false
        vwCircleLoader.startAnimating()
    }
    
    private func removeBlurEffectFromProfilePhoto() {
        if let blurEffectView = imgProfilePhoto.subviews.first(where: { $0 is UIVisualEffectView }) {
            blurEffectView.removeFromSuperview()
        }
    }
    
    // MARK: - Navigation
    private func navigateToHomePage() {
        sceneDelegate?.appNavigation?.dismiss(animated: true) { [weak self] in
            guard let self = self else { return }
            let vc = loadVC(strStoryboardId: SB_MAIN, strVCId: idHomePage) as! HomePage
            setupAppNavigation(with: vc)
        }
    }
    
    private func setupAppNavigation(with viewController: HomePage) {
        sceneDelegate?.appNavigation = UINavigationController(rootViewController: viewController)
        sceneDelegate?.appNavigation?.interactivePopGestureRecognizer?.delegate = nil
        sceneDelegate?.appNavigation?.interactivePopGestureRecognizer?.isEnabled = true
        sceneDelegate?.appNavigation?.isNavigationBarHidden = true
        sceneDelegate?.window?.rootViewController = sceneDelegate?.appNavigation
        sceneDelegate?.window?.makeKeyAndVisible()
        viewController.selectedIndex = 1
    }
}
