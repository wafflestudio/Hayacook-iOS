//
//  Recipe.swift
//  haya
//
//  Created by 신지민 on 2016. 1. 24..
//  Copyright © 2016년 신지민. All rights reserved.
//

import Foundation
import UIKit

class Recipe {
    
    func translate (text : String) -> UIImage {
        
        var result = "empty"
        
        switch text
        {
            
        case "약불" :
            result = "fire1"
        case "중불" :
            result = "fire2"
        case "강불" :
            result = "fire3"
            
        case "냄비" :
            result = "pot"
        case "후라이팬" :
            result = "frypan"
        case "도마" :
            result = "cuttingBoard"
        case "믹서기" :
            result = "mixer"
            
            
        case "참기름" :
            result = "sesameoil-2"
        case "케찹" :
            result = "ketchup-2"
        case "소금" :
            result = "salt-2"
        case "설탕" :
            result = "sugar-2"
        case "간장":
            result = "ganjang-2"
        case "식용유" :
            result = "cookingoil-2"
    
        case "오이":
            result = "cucumber-2"
        case "마늘":
            result = "garlic-2"
        case "청양고추":
            result = "green_chilli-2"
        case "애호박":
                result = "green_pumpkin-2"
        case "강낭콩":
            result = "kidney_bean-2"
        case "김치" :
            result = "kimchi-2"
        case "땅콩" :
            result = "peanut-2"
        case "완두콩" :
            result = "peas-2"
        case "감자" :
            result = "potato-2"
        case "무" :
            result = "radish-2"
        case "햄" :
            result = "ham-2"
        case "고기" :
            result = "red_meat-2"
        case "소시지" :
            result = "sausage-2"
        case "고구마":
            result = "sweet_potato-2"
        case "단호박":
            result = "sweet_pumpkin-2"
        case "참치":
            result = "tuna-2"
        case "비엔나소시지":
            result = "vienna_sausage-2"
        case "꽁치":
            result = "pacific_saury-2"
        case "당근":
            result = "carrot-2"
        case "계란":
            result = "egg-2"
        case "가지":
            result = "eggplant-2"
        case "양파":
            result = "onion-2"
        case "카레":
            result = "curry-2"
        case "아몬드":
            result = "almond-2"
        case "고추":
            result = "chilli-2"
    
        default:
            result = "empty"
        }
        return UIImage(named: result)!

    }
    
    var name : String
    var Ingredients : [String]  /////나중에는 필요 없음. 서버에서 해 줄 것 !
    var difficulty : Int
    var time : Int
    var trash : Int     //서버에서는 waste로 저장

    var top : [UIImage]
    var ingredient : [UIImage]
    var cookware : [UIImage]
    var fire : [UIImage]
    var explanation : [String]
    
   
    
    init(){
        top = []
        ingredient = []
        cookware = []
        fire = []
        explanation = []
        
        name = "김치찌개"
        Ingredients = ["김치", "간장", "감자", "양파"]    //////나중에는 필요 없음. 서버에서 처리해서 넘겨줌 !!!!
        difficulty = 1
        time = 1
        trash = 1
        top = [translate(""), self.translate(""), self.translate(""), self.translate("설탕"), self.translate("")]
        ingredient = [ translate("식용유") , translate("고기") , translate("대파"), translate(""), translate("두부")]
        cookware = [translate("냄비"), translate("냄비"),translate("냄비"), translate("냄비"),translate("냄비")]
        fire = [translate("중불"), translate("중불"),translate("중불"), translate("강불"),translate("중불")]
        explanation = ["냄비에 식용유를 넣는다", "고기를 냄비에 넣고 회색이 될 때까지 볶는다", "냄비에 대파를 넣는다", "냄비에 물을 붓고 설탕을 넣어 간을 맞추며 끓인다", "찌개가 끓을 때쯤 두부를 넣는다"]
        
    }

}