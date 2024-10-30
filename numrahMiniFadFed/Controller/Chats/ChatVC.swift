//
//  ChatVC.swift
//  numrahMiniFadFed
//
//  Created by SamMac on 29/10/24.
//


import UIKit

class ChatVC: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var btnReload: UIButton!
    @IBOutlet weak var btnNotification: UIButton!
    @IBOutlet weak var btnAddPeople: UIButton!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgProfilePhoto: UIImageView!
    
    @IBOutlet weak var vwMsgBoxParent: UIView!
    @IBOutlet weak var btnSend: UIButton!
    @IBOutlet weak var tvMessageArea: UITextView!
    
    @IBOutlet weak var tblChats: UITableView!
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureButtons()
        tvMessageArea.delegate = self
        disableSwipeBackGesture()
        
        tblChats.register(UINib(nibName: idChatListTVC, bundle: nil), forCellReuseIdentifier: idChatListTVC)
    }
    
    // MARK: - Setup Methods
    private func setupView() {
        vwMsgBoxParent.layer.cornerRadius = vwMsgBoxParent.frame.height / 2
        vwMsgBoxParent.layer.borderColor = #colorLiteral(red: 0.8274509804, green: 0.8274509804, blue: 0.8274509804, alpha: 1)
        vwMsgBoxParent.layer.borderWidth = 1.2
    }
    
    private func configureButtons() {
        configureButton(btnReload, title: "تجاوز", imageName: "ic_reload")
        configureButton(btnNotification, title: "إبلاغ", imageName: "ic_info")
        configureButton(btnAddPeople, title: "إضافة", imageName: "ic_addPeople")
    }
    
    private func configureButton(_ button: UIButton, title: String, imageName: String) {
        button.setImage(UIImage(named: imageName), for: .normal)
        button.setTitle(title, for: .normal)
        button.setIconAboveTitle(spacing: 2)
    }
    
    private func disableSwipeBackGesture() {
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
}

// MARK: - IBActions
extension ChatVC {
    
    @IBAction func btnReloadOnClick(_ sender: UIButton) {
        // Reload action implementation
    }
    
    @IBAction func btnNotificationOnClick(_ sender: UIButton) {
        // Notification action implementation
    }
    
    @IBAction func btnAddPeopleOnClick(_ sender: UIButton) {
        // Add people action implementation
    }
    
    @IBAction func btnBackOnClick(_ sender: UIButton) {
        applyTransition(to: sceneDelegate?.appNavigation, transitionSubtype: .fromRight)
        sceneDelegate?.appNavigation?.popViewController(animated: false)
    }
}

// MARK: - UITextViewDelegate
extension ChatVC: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        adjustMessageBoxHeight(for: textView)
    }
    
    private func adjustMessageBoxHeight(for textView: UITextView) {
        // Calculate the size of the text view
        let size = textView.sizeThatFits(CGSize(width: vwMsgBoxParent.frame.width, height: CGFloat.greatestFiniteMagnitude))
        
        // Set the height constraint based on the calculated size
        vwMsgBoxParent.constraints.forEach { constraint in
            if constraint.firstAttribute == .height {
                constraint.constant = min(size.height, 200) // Limit height to 244
            }
        }
        
        // Trigger layout update
        view.layoutIfNeeded()
    }
}


// MARK: - TableView Delegate and DataSource methods
extension ChatVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: idChatListTVC, for: indexPath) as? ChatListTVC else {
            return UITableViewCell()
        }
        
        return cell
    }
    
}
