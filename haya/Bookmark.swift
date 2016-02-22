//
//  Bookmark.swift
//  haya
//
//  Created by 신지민 on 2016. 2. 21..
//  Copyright © 2016년 신지민. All rights reserved.
//

import UIKit

class Bookmark: UIButton {
    
    //images
    let checkedImage = UIImage(named: "Star Filled-30")
    let unCheckedIamge = UIImage(named : "Star-30")
    
    //bool propetry
    var isChecked :Bool = false{
        didSet{
            if isChecked == true {
                self.setImage (checkedImage, forState : .Normal)
            }else{
                self.setImage (unCheckedIamge, forState: .Normal)
            }
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action: "buttonClicked:", forControlEvents : UIControlEvents.TouchUpInside)
        self.isChecked = false
        print("doing")
    }
    
    func buttonClicked(sender: UIButton) {
        if(sender == self){
            if isChecked == true{
                isChecked = false
            }else{
                isChecked = true
            }
        }
    }
    
}
