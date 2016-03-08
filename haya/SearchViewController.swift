//  SearchViewController.swift
//  haya
//
//  Created by 신지민 on 2016. 1. 10..
//  Copyright © 2016년 신지민. All rights reserved.
//

import UIKit


class SearchViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating, UISearchBarDelegate, UICollectionViewDataSource, UICollectionViewDelegate{

    var flag = false
   
    @IBOutlet weak var h: NSLayoutConstraint!
    
   
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    
    @IBOutlet weak var heightMargin: NSLayoutConstraint!
    
    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var table2: UITableView!


    @IBOutlet weak var topView: UIView!
    
    
    let tableData = ["아몬드", "고추", "식용유", "오이", "카레", "계란", "가지", "간장", "마늘", "청양고추", "애호박", "햄", "꽁치", "케찹", "강낭콩", "김치", "양파", "땅콩", "무", "고기", "소금", "소시지", "참기름", "설탕", "고구마", "단호박", "참치", "감자", "비엔나소시지", "당근"]
    
    var tableData2 = [Recipe]()

    var filteredTableData = [String]()
    var filteredTableData2 = [Recipe]()
    
    var havingIngredients = [String]()
    
    var searchController : UISearchController!
    
    @IBOutlet weak var collection: UICollectionView!
    
    var color = UIColor()
    
    
    var IngredientsImages = [UIImage]()
    //var IngredientsImages = [UIImage(named: "carrot")!, UIImage(named: "egg")!, UIImage(named: "eggplant")]

    //var shouldShowSearchResults = false
    
    
////////////////////////////////////////////////////////////////////////////////////////////////////
    func makingRecipe(){
        let temp : Recipe = Recipe()
        temp.name = "김치찌개"
        temp.Ingredients = ["김치", "감자", "양파", "당근"]
        tableData2.append(temp)
    
        let temp2 : Recipe = Recipe()
        temp2.name = "된장찌개"
        temp2.Ingredients = ["두부", "된장", "감자", "버섯", "양파"]
        tableData2.append(temp2)
    }
    
////////////////////////////////////////////////////////////////////////////////////////////////////

    
    func configureSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        
        
        table.tableHeaderView = searchController.searchBar
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.sizeToFit()
        searchController.searchBar.delegate = self
        //table.tableHeaderView = searchController.searchBar
    
        searchController.searchBar.barTintColor = UIColor (red:0.75, green:0.75, blue:0.75, alpha:1)
        searchController.searchBar.layer.borderWidth = 1
        searchController.searchBar.layer.borderColor = UIColor (red:0.75, green:0.75, blue:0.75, alpha:1).CGColor
        
        self.definesPresentationContext = false
        searchController.hidesNavigationBarDuringPresentation = false
        //table.tableFooterView = UIView(frame: CGRectZero)

    }

  
////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    override func viewDidLoad() {
     
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        
        //self.navigationController?.navigationBar.barTintColor = UIColor(red : 247/255, green : 247/255, blue : 247/255, alpha :1 )
        
        self.topView.backgroundColor = UIColor(red : 247/255, green : 247/255, blue : 247/255, alpha :1 )
        
        
        //self.navigationController?.navigationBar.barTintColor = UIColor.redColor()
        //self.navigationController?.navigationBar.frame.origin.y = -50


        //self.navigationController?.navigationBar.shadowImage = UIImage();
        //self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
    
        
        tableHeight.constant = 44
        //tableHeight.constant = 44 * CGFloat(filteredTableData.count + 1) + 20
        configureSearchController()
        makingRecipe()
        table.tableFooterView = UIView(frame: CGRectZero)  //searching 안하는 동안 table view cell 감추기
        
        
       // collection.backgroundColor = UIColor.redColor()
        
        //let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        //layout.sectionInset = UIEdgeInsets(top: 50, left: 10, bottom: 10, right: 10)
        //layout.itemSize = CGSize(width: 10, height: 10)
    
        //let collectionController = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
      //  collectionController.dataSource = self
      //  collectionController.delegate = self
       // collectionController.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: "collectioncell")
        
        let layout = self.collection.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        
        
        collection.dataSource = self
        collection.delegate = self
        collection.backgroundColor = UIColor (red:0.75, green:0.75, blue:0.75, alpha:1)
        collection.layer.borderWidth = 1
        collection.layer.borderColor = UIColor (red:0.75, green:0.75, blue:0.75, alpha:1).CGColor
        // self.view.addSubview(collectionController)
        //Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
 /////////////////////////////////////////////////////////////////////////////////////////////////////
   func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
            return 1
        }
        
   func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return IngredientsImages.count
        }

    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
    
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("collectioncell", forIndexPath: indexPath) as! IngredientsCollectionViewCell
        
        //cell.backgroundColor = UIColor (red:0.9, green:0.6, blue:0.4, alpha:1)
       // cell.backgroundColor = self.searchController.searchBar.barTintColor
        //cell.textLabel?.text = "\(indexPath.section):\(indexPath.row)"
       
        //print("reload")
        
        cell.image.image = IngredientsImages[indexPath.row]
        cell.button.tag = indexPath.row
        cell.button.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        
        //cell.imageView?.image = UIImage(named: "circle")
        return cell
    }
    
    
    func buttonClicked(sender : UIButton){
        havingIngredients.removeAtIndex(sender.tag)
        IngredientsImages.removeAtIndex(sender.tag)
        collection.reloadData()
        
        if(havingIngredients.count == 0){
            self.searchController.active = false;
            self.heightMargin.constant = 64
            self.tableHeight.constant = 44
        
        }
        
        var flagg = true;
        
        filteredTableData2.removeAll(keepCapacity: false)
    
        if !(havingIngredients.count == 0) {
        for( var i = 0 ; i < (tableData2.count) ; i++){
            flagg = true;
            for ( var j = 0; j < (havingIngredients.count) ; j++){
                if !(tableData2[i].Ingredients.contains(havingIngredients[j])){
                    flagg = false;
                    break;
                }}
            if(flagg) {
                filteredTableData2.append(tableData2[i])}
            }}
        
        
        table2.reloadData()

    }
    
    
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView( tableView : UITableView,  titleForHeaderInSection section: Int)->String? {
        if (tableView == self.table2){
            return "Recipe"
        }
        else { return "Ingredients"
        }
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if (tableView == self.table){
            return 20.0
        }
        
        else { return 20.0 }
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(tableView == self.table){
        
            if searchController.active && searchController.searchBar.text != "" {
                return filteredTableData.count
            }
           return 0
            //tableData.count  //원래는 tableData.count
        }
    
        else{
            return filteredTableData2.count
        }
        }
    
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
            
        if(tableView == self.table){
        
            let cell = tableView.dequeueReusableCellWithIdentifier("mycell", forIndexPath: indexPath)
            if searchController.active && searchController.searchBar.text != "" {
               cell.textLabel?.text = filteredTableData[indexPath.row]
            } else {
            
                cell.textLabel?.text = nil
            }
            
            return cell
        }
        
        else{
            let cell = tableView.dequeueReusableCellWithIdentifier("mycell2", forIndexPath: indexPath) as! RecipeTableViewCell
        
            
                cell.name.text = filteredTableData2[indexPath.row].name
                cell.time.text = "\(filteredTableData2[indexPath.row].time)"
                cell.difficulty.text = "\(filteredTableData2[indexPath.row].difficulty)"
                cell.trash.text = "\(filteredTableData2[indexPath.row].trash)"
            
            
                //cell.textLabel?.text = filteredTableData2[indexPath.row].name
        
            
            return cell
        }
 
    }
    
    ///////////////////////////////////////////
    var chosenCellIndex = 0
    var foodName = String()
    var numberofRecipe = 0
    
    /////////////////////////////////////////// 넘겨줄 정보
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
       // heightMargin.constant = 60
        
        if(tableView == self.table){
        let text = filteredTableData[indexPath.row]
        havingIngredients.insert(text, atIndex: 0)
        var result = "willbechanged"
       // print(text)
        
        switch text
        {
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
            result = "onion"
            case "카레":
            result = "curry-2"
            case "아몬드":
            result = "almond-2"
            case "고추":
            result = "chilli-2"
            
            default:
            result = "Cancel"
        }
        
        IngredientsImages.insert(UIImage(named: result)!, atIndex: 0)
        //print(havingIngredients)
        //print(IngredientsImages)
        //print(tableHeight)
            
        collection.reloadData()
            
        var flagg = true;
            
        filteredTableData2.removeAll(keepCapacity: false)
            
        for( var i = 0 ; i < (tableData2.count) ; i++){
            flagg = true;
            for ( var j = 0; j < (havingIngredients.count) ; j++){
                if !(tableData2[i].Ingredients.contains(havingIngredients[j])){
                    flagg = false;
                    break;
                }}
            if(flagg) {
                filteredTableData2.append(tableData2[i])}
            }
        
        
        table2.reloadData()
        
        if(heightMargin.constant == 124){
            self.searchController.active = false;
        }
        else {
            /*
            UIView.animateWithDuration(100, animations: {
                self.heightMargin.constant = 60
            })*/
            //table.tableHeaderView = searchController.searchBar
            heightMargin.constant = 124
            tableHeight.constant = 44 * CGFloat(filteredTableData.count + 1) + 20
            self.searchController.active = false;
        }
        }
        else{
        
            chosenCellIndex = indexPath.row  ///////////////// temper
            foodName = filteredTableData2[indexPath.row].name
            numberofRecipe = filteredTableData2[indexPath.row].top.count
            
            // Start segue with index of cell clicked
            self.performSegueWithIdentifier("yourSegue", sender: self)

        
            }
            
        }
    
    
    //////////////////////////////////////////////////////////////////////////////////////
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // get a reference to the second view controller
        let secondViewController = segue.destinationViewController as! PageViewController
        secondViewController.countOfLandingPage = numberofRecipe
        print(numberofRecipe)
        secondViewController.foodName = self.foodName
        
        // set a variable in the second view controller with the data to pass
        
    }

    //////////////////////////////////////////////////////////////////////////////// PARAMETER 넘겨주기

    
    func updateSearchResultsForSearchController(searchController : UISearchController)
    {
            filteredTableData.removeAll(keepCapacity: false)
        
            let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
            let array = (tableData as NSArray).filteredArrayUsingPredicate(searchPredicate)
            filteredTableData = array as! [String]
        
        if(filteredTableData.count != 0){
            tableHeight.constant = 44 * CGFloat(filteredTableData.count + 1) + 20 }
        else {
            tableHeight.constant = 44
        }
            self.table.reloadData()
    
        //print(filteredTableData)
    }
    
}

