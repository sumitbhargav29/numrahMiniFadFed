//
//  ChatListVC.swift
//  numrahMiniFadFed
//
//  Created by SamMac on 29/10/24.
//

import UIKit

class ChatListVC: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tblChatList: UITableView!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    // MARK: - Setup Methods
    private func setupTableView() {
        tblChatList.register(UINib(nibName: idChatListTVC, bundle: nil), forCellReuseIdentifier: idChatListTVC)
    }
}

// MARK: - TableView Delegate and DataSource methods
extension ChatListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: idChatListTVC, for: indexPath) as? ChatListTVC else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigateToChatVC()
    }
    
    // MARK: - Navigation
    private func navigateToChatVC() {
        guard let vc = MainInStoryboard.instantiateViewController(withIdentifier: idChatVC) as? ChatVC else { return }
        
        applyTransition(to: sceneDelegate?.appNavigation, transitionSubtype: .fromLeft)
        sceneDelegate?.appNavigation?.pushViewController(vc, animated: false)
    }
}
