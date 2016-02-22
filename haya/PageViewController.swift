//  PageViewController.swift
//  haya
//
//  Created by 신지민 on 2016. 2. 8..
//  Copyright © 2016년 신지민. All rights reserved.
//

import UIKit

class PageViewController: UIViewController, UIPageViewControllerDataSource {
    
    
    var countOfLandingPage = 5
    var foodName = String()
    var TestRecipes = Recipe()
    
    /*
    private let names = ["김치찌개", "된장찌개", "간장계란밥"]
    private let firstImages = ["carrot-2.png", "egg.png", "eggplant.png"]
    private let secondImages = ["carrot-2.png", "egg.png", "eggplant.png"]
    private let thirdImages = ["carrot-2.png", "egg.png", "eggplant.png"]
    private let forthImages = ["carrot-2.png", "egg.png", "eggplant.png"]
    private let exp = ["하나", "둘", "셋"]
*/
    
  ///////////////////////////////////////////////////// search view controller 에서 받아와야 하는 부분 
    ////////////////////////////////////////////////// var 로 고치고 prepare for Segue에서 넘겨준다. 
    
    
    private func getItemController(itemIndex : Int) -> ContentViewController?{
        
        if itemIndex < countOfLandingPage {
            
            let contentViewController = self.storyboard!.instantiateViewControllerWithIdentifier("ContentController") as! ContentViewController
            contentViewController.index = itemIndex
            //contentViewController.food = TestRecipes.names[itemIndex]
            contentViewController.one = self.TestRecipes.top[itemIndex]
            contentViewController.two = self.TestRecipes.ingredient[itemIndex]
            contentViewController.three = self.TestRecipes.cookware[itemIndex]
            contentViewController.four = self.TestRecipes.fire[itemIndex]
            contentViewController.exp = self.TestRecipes.explanation[itemIndex]
            contentViewController.number = self.countOfLandingPage
            
            return contentViewController
        }
        
        return nil
    }
    /*
    func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
        
        let pageControl = UIPageControl.appearance()
        
        pageControl.tintColor = UIColor.redColor()
        pageControl.pageIndicatorTintColor = UIColor.blackColor()
        pageControl.currentPageIndicatorTintColor = UIColor.redColor()
        pageControl.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
    }*/
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        let contentController = viewController as! ContentViewController
        if contentController.index > 0 {
            return getItemController(contentController.index - 1)
        }
        
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        let contentController = viewController as! ContentViewController
        if contentController.index + 1 < countOfLandingPage + 1 {
            return getItemController(contentController.index + 1)
        }
        
        return nil
    }
    /*
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return names.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
*/
    
    let checkedImage = UIImage(named: "Star Filled-30")
    let unCheckedIamge = UIImage(named : "Star-30")


    let button: UIButton = UIButton()
    
    func buttonClicked(sender: UIButton!) {
            if isChecked == true{
                isChecked = false
        }
            else{
            isChecked = true
        }
    }

     var isChecked :Bool = false{
        didSet{
            if isChecked == true {
                button.setImage (checkedImage, forState : .Normal)
            }else{
                button.setImage (unCheckedIamge, forState: .Normal)
            }
        }
    }
  

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        button.setImage(UIImage(named: "Star-30"), forState: .Normal)
        button.frame = CGRectMake(0, 0, 45, 45)
        button.addTarget(self, action: "buttonClicked:", forControlEvents : UIControlEvents.TouchUpInside)
        
        let rightItem:UIBarButtonItem = UIBarButtonItem()
        rightItem.customView = button
        
        self.navigationItem.rightBarButtonItem = rightItem
       
        
      
       // print(countOfLandingPage)
       // countOfLandingPage = TestRecipes.explanation.count
        
        self.navigationItem.title = foodName
       //self.navigationController?.navigationBar.backgroundColor = UIColor(red: 240/255 , green : 128/255 , blue : 128/255 , alpha : 0)
       self.navigationController?.navigationBar.barTintColor = UIColor(red: 240/255 , green : 128/255 , blue : 128/255 , alpha : 0)
        self.navigationController?.navigationBar.shadowImage = UIImage();
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)

       self.navigationController?.navigationBar.translucent = false
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
            //UIColor(red : 0.7, green : 0 , blue : 0, alpha:1)
       
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.Plain, target: self, action: "back:")
        self.navigationItem.leftBarButtonItem = newBackButton;
        
        //self.navigationController?.navigationBarHidden = true //////// navigation bar 숨기기
        //configurePageControl()
        
        let pageController = self.storyboard!.instantiateViewControllerWithIdentifier("PageController") as! UIPageViewController
        
        pageController.dataSource = self
        
        let firstController = getItemController(0)
        let startingViewController : NSArray = [firstController!]
        pageController.setViewControllers(startingViewController as? [UIViewController], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
        // Do any additional setup after loading the view.
        
        addChildViewController(pageController)
        self.view.addSubview(pageController.view)
        pageController.didMoveToParentViewController(self)
    }
    
    
    func back(sender: UIBarButtonItem) {
        // Perform your custom actions
    
        let n: Int! = self.navigationController?.viewControllers.count
        let myUIViewController = (self.navigationController?.viewControllers[n-2])! as! SearchViewController
        myUIViewController.collection.reloadData()
        //myUIViewController.viewDidLoad()
        
        myUIViewController.searchController.active = false
       // myUIViewController.heightMargin.constant = 0
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red : 247/255, green : 247/255, blue : 247/255, alpha :1 )
        
        self.navigationController?.navigationBar.tintColor = UIColor.blackColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.blackColor()]
        
        // Go back to the previous ViewController
        self.navigationController?.popViewControllerAnimated(true)
        //myUIViewController.viewDidLoad()
        
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

