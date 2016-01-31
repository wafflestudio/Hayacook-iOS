//
//  IngredientsCollectionViewCell.swift
//  haya
//
//  Created by 신지민 on 2016. 1. 23..
//  Copyright © 2016년 신지민. All rights reserved.
//

import UIKit

class IngredientsCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var image: UIImageView!

    @IBOutlet weak var button: UIButton!
    
    
    
    override func awakeFromNib() {
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor.whiteColor().CGColor
        image.layer.backgroundColor = UIColor.whiteColor().CGColor
        image.layer.cornerRadius = image.frame.height/2
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor (red:0.75, green:0.75, blue:0.75, alpha:1).CGColor
        button.layer.backgroundColor = UIColor (red:0.75, green:0.75, blue:0.75, alpha:1).CGColor
        button.layer.cornerRadius = button.frame.height/2

    }
}
