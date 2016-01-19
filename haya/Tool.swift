//
//  Tool.swift
//  haya
//
//  Created by 신지민 on 2016. 1. 7..
//  Copyright © 2016년 신지민. All rights reserved.
//

import UIKit

class Tool {
    
    var name: String
    var rating: Int
    
    // MARK: Initialization
    
    init?(name: String, rating: Int) {
        // Initialize stored properties.
        self.name = name
        self.rating = rating

        
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
    

}