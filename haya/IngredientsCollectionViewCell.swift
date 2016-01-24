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

    }
}
