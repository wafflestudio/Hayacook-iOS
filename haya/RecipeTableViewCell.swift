//
//  RecipeTableViewCell.swift
//  haya
//
//  Created by 신지민 on 2016. 1. 24..
//  Copyright © 2016년 신지민. All rights reserved.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {
    
    
   
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var difficulty: UILabel!
    @IBOutlet weak var trash: UILabel!
   

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /*
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
            
            let  headerCell = tableView.dequeueReusableCellWithIdentifier("HeaderCell") as! RecipeTableViewCell
            headerCell.backgroundColor = UIColor.grayColor()
            
            headerCell.headerLabel.text = "Recipe";
            headerCell.headerLabel.sizeToFit()
            
            
            return headerCell
        }*/

}


