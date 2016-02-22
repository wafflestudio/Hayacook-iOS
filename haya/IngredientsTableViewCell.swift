//
//  IngredientsTableViewCell.swift
//  haya
//
//  Created by 신지민 on 2016. 1. 9..
//  Copyright © 2016년 신지민. All rights reserved.
//

import UIKit

class IngredientsTableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var ratings: RatingControl!
    
    @IBOutlet weak var checkBox: UIImageView!
    @IBOutlet weak var back: UIView!
    
    var checked : Bool = false


    override func awakeFromNib() {
        super.awakeFromNib()
        
        back.layer.backgroundColor = UIColor(white: 0.75, alpha : 1).CGColor
        back.layer.cornerRadius = back.frame.height/2
        
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
