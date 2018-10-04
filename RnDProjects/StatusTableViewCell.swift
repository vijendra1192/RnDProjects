//
//  StatusTableViewCell.swift
//  RnDProjects
//
//  Created by Vijendra  on 29/09/18.
//  Copyright © 2018 Vijendra . All rights reserved.
//

import UIKit

class StatusTableViewCell: UITableViewCell {

    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblName: UILabel!
    
    
    
    var statuses : StatusStruct!
    {
        didSet
        {
            lblStatus.text = statuses.status
            lblName.text = (statuses.name?.isEmpty)! ? "Default" : statuses.name
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
