//
//  ChatListVC.swift
//  numrahMiniFadFed
//
//  Created by SamMac on 29/10/24.
//

import UIKit

class ChatListVC: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var tblChatList: UITableView!
    
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tblChatList.register(UINib(nibName: idChatListTVC, bundle: nil), forCellReuseIdentifier: idChatListTVC)
    }
    
    //    func pushViewControllerWithRightToLeftTransition(_ viewController: UIViewController, from navigationController: UINavigationController?) {
    //        let transition = CATransition()
    //        transition.duration = 0.3
    //        transition.type = .push
    //        transition.subtype = .fromRight  // Right-to-left transition
    //        transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
    //
    //        navigationController?.view.layer.add(transition, forKey: kCATransition)
    //        navigationController?.pushViewController(viewController, animated: false)
    //    }
    
    
}


// MARK: - TableView Delegate and DataSource methods
extension ChatListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Cast the dequeued cell to your custom cell type
        if let cell = tableView.dequeueReusableCell(withIdentifier: idChatListTVC, for: indexPath) as? ChatListTVC {
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = MainInStoryboard.instantiateViewController(withIdentifier: idChatVC) as? ChatVC {
            let transition = CATransition()
            transition.duration = 0.3
            transition.type = .push
            transition.subtype = .fromRight  // Right-to-left transition
            transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            
            sceneDelegate?.appNavigation?.view.layer.add(transition, forKey: kCATransition)
            sceneDelegate?.appNavigation?.pushViewController(vc, animated: false)
        }
    }
    
}
