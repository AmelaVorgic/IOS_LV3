//
//  UniViewCell.swift
//  lv3_Vorgic
//
//  Created by student on 14.05.2022..
//

import UIKit

class UniViewCell: UITableViewCell {
    
    
    @IBOutlet weak var name: UITextView!
    @IBOutlet weak var country: UITextView!
    @IBOutlet weak var url: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
