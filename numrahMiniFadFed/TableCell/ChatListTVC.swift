//
//  ChatListTVC.swift
//  numrahMiniFadFed
//
//  Created by SamMac on 29/10/24.
//

import UIKit

class ChatListTVC: UITableViewCell {
    
    @IBOutlet weak var imgProfilePhoto: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblSubStatus: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
