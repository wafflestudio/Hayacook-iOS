//
//  ToolTableViewCell.swift
//  haya
//
//  Created by 신지민 on 2016. 1. 7..
//  Copyright © 2016년 신지민. All rights reserved.
//

import UIKit

class ToolTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingControl: RatingControl!

    @IBOutlet weak var checkBox: UIImageView!
    
    @IBOutlet weak var back: UIView!
    
    var checked : Bool = false
    
    //var ImageView = UIImageView(frame: CGRectMake(100, 150, 150, 150)); // set as you want
    //var realImage = UIImage(named: "empty");
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        back.layer.backgroundColor = UIColor(white: 0.75, alpha : 1).CGColor
        back.layer.cornerRadius = back.frame.height/2
        
        }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
