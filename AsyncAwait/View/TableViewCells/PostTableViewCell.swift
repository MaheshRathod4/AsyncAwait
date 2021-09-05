//
//  PostTableViewCell.swift
//  PostTableViewCell
//
//  Created by Mahesh Rathod on 05/09/21.
//

import Foundation
import UIKit

class PostTableViewCell : UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupUI(post:Post) {
        self.lblTitle.text = post.title
    }
    
    
}
