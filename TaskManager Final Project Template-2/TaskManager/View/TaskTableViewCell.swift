//
//  TaskTableViewCell.swift
//  TaskManager
//
//  Created by Bilegt Davaa on 2022-12-06.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    
    static let identifier = "TaskTableViewCell"
    
    @IBOutlet var lbltitle : UILabel!
    @IBOutlet var lbluser : UILabel!
    @IBOutlet var imgdone : UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setContent(task : TaskModel){
        lbluser.text = task.createdByName
        lbltitle.text = task.description
        
        if(task.done == true){
            imgdone.image = UIImage(systemName: "checkmark")
        }
        else{
            imgdone.image = UIImage(systemName: "xmark")
        }
    }
    
}
