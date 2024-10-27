//
//  AppExtension.swift
//  MVVMSumit
//
//  Created by Sam-Ranium on 14/10/22.
//

import Foundation
import UIKit

//MARK:- Global var declaration
let dateFormatter = DateFormatter()
let date = Date()
let AppName = "Numrah MiniFadFed"


extension UIViewController {
    
    //MARK:- for Showing Alert
    func setPresentAlert(withTitle title: String, message : String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { action in
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showToast(message : String) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 160, y: self.view.frame.size.height-150, width: 320, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        //        toastLabel.font = UIFont(name: Constants.font, size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 20
        toastLabel.clipsToBounds  =  true
        toastLabel.layoutMargins.bottom = 200
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    func showAlert(_ title: String, _ message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        if let popoverController = alert.popoverPresentationController {
            popoverController.sourceView = self.view
            popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            popoverController.permittedArrowDirections = []
        }
        self.present(alert, animated: true, completion: nil)
    }
    
}


extension UIView{
    func activityStartAnimating() {
        DispatchQueue.main.async {
            let activityIndicator = UIActivityIndicatorView(style: .medium)
            activityIndicator.center = self.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.startAnimating()
            activityIndicator.tag = 475647
            self.isUserInteractionEnabled = false
            self.addSubview(activityIndicator)
        }
    }
    
    func activityStopAnimating() {
        DispatchQueue.main.async{
            if let background = self.viewWithTag(475647){
                background.removeFromSuperview()
            }
            self.isUserInteractionEnabled = true
        }
    }
}

extension UIViewController {
    func alert(message: String, title: String = "") {
        let messageVC = UIAlertController(title: title, message: message , preferredStyle: .actionSheet)
        if let popoverController = messageVC.popoverPresentationController {
            popoverController.sourceView = self.view
            popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            popoverController.permittedArrowDirections = []
        }
        DispatchQueue.main.async {
            self.present(messageVC, animated: true) {
                Timer.scheduledTimer(withTimeInterval: 3, repeats: false, block: { (_) in
                    messageVC.dismiss(animated: true, completion: nil)})}
        }
    }
}

//MARK: - HTTPURLResponse
extension HTTPURLResponse {
    func isResponseOK() -> Bool {
        return (200...299).contains(self.statusCode)
    }
}

extension UIButton {
    func setUnderlinedTitle(_ title: String, for state: UIControl.State) {
        let attributes: [NSAttributedString.Key: Any] = [
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        let attributedTitle = NSAttributedString(string: title, attributes: attributes)
        self.setAttributedTitle(attributedTitle, for: state)
    }
}