//
//  TextMsgTVC.swift
//  numrahMiniFadFed
//
//  Created by SamMac on 31/10/24.
//

import UIKit

class TextMsgTVC: UITableViewCell {
    
    @IBOutlet weak var vwMsgBodyParent: UIView!
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var imgMessageStatus: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        vwMsgBodyParent.layer.cornerRadius = 10
        vwMsgBodyParent.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner]
        vwMsgBodyParent.layer.borderColor = #colorLiteral(red: 0.8901960784, green: 0.9176470588, blue: 0.9921568627, alpha: 1)
        vwMsgBodyParent.layer.borderWidth = 1
        vwMsgBodyParent.layer.masksToBounds = true
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
