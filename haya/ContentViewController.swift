//
//  ContentViewController.swift
//  haya
//
//  Created by 신지민 on 2016. 2. 8..
//  Copyright © 2016년 신지민. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

    @IBOutlet weak var bottonview: UIView!
    
    var index : Int = 0
    
    @IBOutlet weak var PageControl: UIPageControl!
    
    var number : Int = 0
    
    @IBOutlet weak var foodName: UILabel!
    
    var food : String = ""
    
    @IBOutlet weak var explain: UILabel!
    
    var exp : String = ""
    
    @IBOutlet weak var first: UIImageView!
    
    var one = UIImage()
    
    @IBOutlet weak var second: UIImageView!
    
    var two = UIImage()
    @IBOutlet weak var third: UIImageView!
    
    var three = UIImage()
    
    @IBOutlet weak var forth: UIImageView!
    
    var four = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bottonview.backgroundColor = UIColor(red: 240/255 , green : 128/255 , blue : 128/255 , alpha : 1)

        //self.navigationController?.navigationBar.translucent = false
        
       // self.navigationController?.navigationBar.backgroundColor = UIColor(red: 240/255 , green : 128/255 , blue : 128/255 , alpha : 1)
        //self.navigationController?.navigationBar.barTintColor = UIColor(red: 240/255 , green : 128/255 , blue : 128/255 , alpha : 1)
    
        
        //self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        //self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        //foodName.text = food
        explain.text = exp
        explain.textColor = UIColor.whiteColor()
        first.image = one
        second.image = two
        third.image = three
        forth.image = four
        
        PageControl.numberOfPages = number
            //바꿔야하는부분
        PageControl.currentPage = index
        PageControl.pageIndicatorTintColor = UIColor.grayColor()
        PageControl.currentPageIndicatorTintColor = UIColor.whiteColor()
        //PageControl.backgroundColor = UIColor.darkGrayColor()
        
        // Do any additional setup after loading the view.
    }
    
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
