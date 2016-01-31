//
//  Recipe.swift
//  haya
//
//  Created by 신지민 on 2016. 1. 24..
//  Copyright © 2016년 신지민. All rights reserved.
//

import Foundation

class Recipe {
    
    var name : String
    var Ingredients : [String]
    var difficulty : Int
    var time : Int
    var trash : Int
    
    init(){
        self.name = "김치찌개"
        Ingredients = ["김치", "간장", "감자", "양파"]
        difficulty = 1
        time = 1
        trash = 1
    }

}