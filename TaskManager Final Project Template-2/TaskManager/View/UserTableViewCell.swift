//
//  UserTableViewCell.swift
//  TaskManager
//
//  Created by Bilegt Davaa on 2022-12-06.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    
    static let identifier = "UserTableViewCell"
    
    
    @IBOutlet var lblusername : UILabel!
    @IBOutlet var lblemail : UILabel!
    @IBOutlet var imgstar : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setContent(user: UserModel){
        
        lblusername.text = user.name.capitalized
        lblemail.text = user.email.uppercased()
    
    }
    
}
