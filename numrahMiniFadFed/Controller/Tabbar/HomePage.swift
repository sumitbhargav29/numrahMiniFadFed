//
//  HomePage.swift
//  numrahMiniFadFed
//
//  Created by SamMac on 28/10/24.
//


import Foundation
import UIKit

class HomePage: UITabBarController,UITabBarControllerDelegate {
    
    public let clr_PowderBlue = #colorLiteral(red: 0.6235294118, green: 0.6352941176, blue: 0.7411764706, alpha: 1)                 // 4F62EE
    
    let centerBtn = UIButton.init(type: .custom)
    fileprivate lazy var defaultTabBarHeight = { tabBar.frame.size.height }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialize()
        
        UITabBar.appearance().unselectedItemTintColor = clr_PowderBlue
        UITabBar.appearance().barTintColor = UIColor.white
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for:.selected)
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -6)
        
        // Adjust icon position to be 10 points from the top
        for item in self.tabBar.items ?? [] {
            item.imageInsets = UIEdgeInsets(top: 10, left: 0, bottom: -10, right: 0) // Moves icon 10 points up
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        switch UIScreen.main.nativeBounds.height {
        case 1136,1334,1920,2208:
            tabBar.frame.size.height = 70
            tabBar.frame.origin.y = view.frame.height - 70
            
            centerBtn.frame.size = CGSize(width: 64, height: 64)
            centerBtn.center = CGPoint(x: self.tabBar.center.x , y: self.tabBar.center.y)
            
            break
        default :
            
            let newTabBarHeight = defaultTabBarHeight + 16.0
            var newFrame = tabBar.frame
            newFrame.size.height = newTabBarHeight
            newFrame.origin.y = view.frame.size.height - newTabBarHeight
            tabBar.frame = newFrame
            
            centerBtn.frame.size = CGSize(width: 64, height: 64)
            centerBtn.center = CGPoint(x: self.tabBar.center.x , y: self.tabBar.center.y - 10)
            
        }
        self.centerBtn.layer.cornerRadius = centerBtn.frame.height/2
    }
    
    //    MARK:- Initialization
    func initialize() {
        centerBtn.setTitle("رفض", for: .normal)
        //        centerBtn.setImage(UIImage(named: ""), for: .normal)
        centerBtn.backgroundColor = UIColor.clrTabButton
        centerBtn.clipsToBounds = false
        centerBtn.contentMode = .scaleAspectFit
        centerBtn.addTarget(self, action: #selector(handleTouchTabbarCenter), for: .touchUpInside)
        self.view.insertSubview(centerBtn, aboveSubview: self.tabBar)
    }
    
    @objc func handleTouchTabbarCenter(sender : UIButton) {
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



