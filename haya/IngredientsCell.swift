//
//  IngredientsCell.swift
//  haya
//
//  Created by 신지민 on 2016. 1. 9..
//  Copyright © 2016년 신지민. All rights reserved.
//

import UIKit

class IngredientsCell: UITableViewCell {

    
    @IBOutlet weak var check: CheckBox!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratings: RatingControl!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    

    
}