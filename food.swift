//
//  food.swift
//  segue
//
//  Created by 신지민 on 2015. 12. 29..
//  Copyright © 2015년 신지민. All rights reserved.
//

import UIKit

struct food {
    var name : String?
    var game : String?
    var rating : Int
    
    init(name : String? , game : String? , rating : Int){
        self.name = name
        self.game = game
        self.rating = rating
    }
}
